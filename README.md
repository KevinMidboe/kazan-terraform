# Kazan terraform 🧊

Terraform plan for spinning up kubernetes cluster (named kazan) on local proxmox host.

Ansible project for configuration: [https://github.com/kevinmidboe/kazan-ansible](https://github.com/kevinmidboe/kazan-ansible)

## Setup
Export credentials for proxmox host:

```
  export PM_API_TOKEN_ID=''
  export PM_API_TOKEN_SECRET=''
```

Download repo:
```
git clone git@github.com:kevinmidboe/kazan-terraform.git
cd kazan-terraform
```

## Terraform state file
The terraform state (`tf.state` file) is stored in my gcp bucket. If you want change bucket provider/location do so by editing *gcs* backend definition in `main.ts`.
To store locally instead change comment in *local* and out *gcs* in backend definition in `main.ts`.

## Run

If this is first time running tf plans:
```
terraform init
```

then 
```
terraform apply
```
