#!/usr/bin/python3
from xmlrpc.client import boolean
from python_terraform import *
import argparse
import os
import json
import sys

nfs_acr = Terraform(working_dir="./instances")
#nfs_acr = Terraform(working_dir="./nfs-acr")
#aks = Terraform(working_dir="./AKS")

def check_nfs_acr_tfstate():
    print("Checking if there is available nfs ecr")
    nfs_acr_tfstate = open('./instances/terraform.tfstate')
    nfs_acr_data = json.load(nfs_acr_tfstate)
    nfs_acr_resources = len(nfs_acr_data['resources'])
    nfs_acr_tfstate.close()

#    nfs_acr_tfstate = open('./nfs-acr/terraform.tfstate')
#    nfs_acr_data = json.load(nfs_acr_tfstate)
#    nfs_acr_resources = len(nfs_acr_data['resources'])
#    nfs_acr_tfstate.close()

    if nfs_acr_resources == 0:
        return False
    return True

def initialize(init_nfs_acr, init_aks):
    if init_nfs_acr is True:
        try:
            print("initializing nfs acr")
            nfs_acr.init()
            print("nfs and acr initiallized")
            return 0
        except Exception as err:
            print("NFS-ACR Init", err)
            return 1   

    if init_aks is True:
        try:
            print("Initializing aks")
            aks.init()
            print("aks initialized")
            return 0
        except Exception as err:
            print("AKS Init", err)
            return 1        

def plan(plan_nfs_acr, plan_aks):
    if plan_nfs_acr is True:
        try:
            print(nfs_acr.plan())
            return 0
        except Exception as err:
            print("NFS-ACR Plan", err)
            return 1   

    if plan_aks is True:
        try:
            print(aks.plan())
            return 0
        except Exception as err:
            print("AKS Plan", err)
            return 1        

def apply(apply_nfs_acr, apply_aks):
    if apply_nfs_acr is True and apply_aks is True:
        try:
            print("applying nfs-acr and aks")
            nfs_acr.apply(skip_plan=True)
            aks.apply(skip_plan=True)
            print("nfs-acr and eks applied")
            return 0
        except Exception as err:
            print("NFS-ACR, AKS Apply", err)
            return 1     

    if apply_nfs_acr is True:
        try:
            print("applying nfs acr")
            nfs_acr.apply(skip_plan=True)
            print("nfs acr applied")
            return 0
        except Exception as err:
            print("NFS-ACR Apply", err)
            return 1     

    if apply_aks is True and apply_nfs_acr is False:
        if check_nfs_acr_tfstate() is False:
            print("Unable to create ACR without NFS & ACR")
            sys.exit(1)
        try:
            print("applying aks")
            aks.apply(skip_plan=True)
            print("aks applied")
            return 0
        except Exception as err:
            print("AKS Apply", err)
            return 1                      
    else:
        try:
            print("applying aks")
            aks.apply(skip_plan=True)
            print("aks applied")
            return 0
        except Exception as err:
            print("AKS Apply", err)
            return 1              

def main(
    init_nfs_acr,
    init_aks,
    plan_nfs_acr,
    plan_aks,
    apply_nfs_acr,
    apply_aks,
    ):
    
    if init_nfs_acr is True or init_aks is True:
        initialize(init_nfs_acr, init_aks)

    if plan_nfs_acr is True or plan_aks is True:
        plan(plan_nfs_acr, plan_aks)        
    
    if apply_nfs_acr is True or apply_aks is True:
        apply(apply_nfs_acr, apply_aks)

if __name__ == "__main__":
    arguments = argparse.ArgumentParser(description="Parameters for terraform codes")
    
    arguments.add_argument("--init-nfs-acr", type=bool, default=False, help="Terraform init nfs & acr")
    arguments.add_argument("--init-aks", type=bool, default=False, help="Terraform init aks")
                              
    arguments.add_argument("--plan-nfs-acr", type=bool, default=False, help="Terraform plan nfs & acr")
    arguments.add_argument("--plan-aks", type=bool, default=False, help="Terraform plan aks")
                              
    arguments.add_argument("--apply-nfs-acr", type=bool, default=False, help="Terraform apply nfs & acr")
    arguments.add_argument("--apply-aks", type=bool, default=False, help="Terraform apply aks")  

    args = arguments.parse_args()

    main(
        args.init_nfs_acr,
        args.init_aks,
        args.plan_nfs_acr,
        args.plan_aks,
        args.apply_nfs_acr,
        args.apply_aks
    )
