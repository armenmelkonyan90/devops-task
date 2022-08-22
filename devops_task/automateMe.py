#!/usr/bin/python3
from python_terraform import *
import os
import json
import base64
import git
import yaml
import argparse

nfs_acr = Terraform(working_dir="./nfs-acr")
aks = Terraform(working_dir="./AKS")

def git_clone(token):
    git.Git(".").clone("https://hakobmkoyan771:"+str(token)+"@github.com/hakobmkoyan771/infra.git")

def git_commit():
    os.system('''cd infra; git add .''')
    os.system('''cd infra; git commit -m "Configured Secrets and Volumes"''')
    os.system('''cd infra; git push''')

def change_pv_file(addr):
    with open('infra/Volumes/pv.yaml') as pvManifest:
        data = yaml.load(pvManifest, Loader=yaml.FullLoader)
        data['spec']['nfs']['server'] = str(addr)
        with open('infra/Volumes/pv.yaml', 'w') as newManifest:
            yaml.dump(data, newManifest)

def change_secret_file(cred):
    with open('infra/Secrets/webapps-reg-secret.yaml') as secretManifest:
        data = yaml.load(secretManifest, Loader=yaml.FullLoader)
        data['data']['.dockerconfigjson'] = str(cred)
        with open('infra/Secrets/webapps-reg-secret.yaml', 'w') as newManifest:
            yaml.dump(data, newManifest)

def encode_reg_config(acr_name_pswd):
    dockerconfigjson = '''{"auths":{"https://index.docker.io/v1/":{"auth":"'''+str(acr_name_pswd)+'''"}}}'''
    msg_bytes    = dockerconfigjson.encode('ascii')
    base64_bytes = base64.b64encode(msg_bytes)
    base64_msg   = base64_bytes.decode('ascii')

    return str(base64_msg)

def encode_acr_name_pswd(cred):
    msg_bytes    = cred.encode('ascii')
    base64_bytes = base64.b64encode(msg_bytes)
    base64_msg   = base64_bytes.decode('ascii')

    return str(base64_msg)

def outs():
    nfs_acr_out  = nfs_acr.output()
    acr_username = str(nfs_acr_out['acr_username']['value'])
    acr_password = str(nfs_acr_out['acr_password']['value'])
    nfs_address  = str(nfs_acr_out['nfs_public_ip']['value'])
    
    return acr_username,acr_password,nfs_address

def main(token):
    nfs_acr.apply(skip_plan=True)
    outputs                = outs()
    
    acrcred                = outputs[0]+":"+outputs[1]
    nfsaddr                = outputs[2]
    acr_encoded_cred       = encode_acr_name_pswd(acrcred)
    acr_config_reg_encoded = encode_reg_config(acr_encoded_cred)
    
    git_clone(token)

    change_secret_file(acr_config_reg_encoded)
    change_pv_file(nfsaddr)

    aks.apply(skip_plan=True)

if __name__ == "__main__":
    arguments = argparse.ArgumentParser(description="Git token")
    arguments.add_argument("--token", type=str, required=True, help="Git Token")
    args = arguments.parse_args()

    main(args.token)
