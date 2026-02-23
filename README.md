# Compte Rendu : Déploiement de 2 VMs Azure via terraform (avec LoadBalancer)
## Samuel KAKEZ

#### 1. Installation des outils 
J'ai commencé par installer Azure CLI (un fichier .msi)
![](/screenshots/install-azure-cli.png)
et Terraform sur PowerShell
![](/screenshots/terraform-version.png)

#### 2. Connexion à Azure

![](/screenshots/azure-login.png)

#### 3. Structure du projet

![](/screenshots/code-tree.png)

#### 4. Infra déployée

##### Réseau
Resource Group tp-azure-rg, VNet tp-azure-vnet (10.0.0.0/16), Subnet tp-azure-subnet (10.0.1.0/24) en région switzerlandnorth.
###### (france central ne fonctionne pas...)

##### Sécurité — NSG
Trois règles inbound sur tp-azure-nsg : autorisation SSH (port 22, priorité 100), autorisation HTTP (port 80, priorité 200), refus de tout le reste (priorité 4096). NSG associé au subnet.
##### Machines virtuelles
2 VMs Ubuntu 22.04 LTS Standard_B1s, authentification par clé SSH, Nginx installé automatiquement via custom_data au premier boot avec une page HTML personnalisée affichant le nom de chaque VM.
##### Load Balancer
IP publique statique tp-azure-lb-pip, Load Balancer Standard tp-azure-lb, backend pool associant les 2 NICs, health probe HTTP sur /, règle de distribution TCP 80→80.

#### 5. Déploiement

terraform init 

![](/screenshots/init.png)

terraform plan 

![](/screenshots/plan.png)

terraform apply

![](/screenshots/terraform-apply-complete.png)

J'ai créé 16 ressources.

#### 6. Validation

avec curl http://20.203.145.34 (LoadBalancer), les deux VMs répondent !

Réponse de la vm1 avec curl
![](/screenshots/curl-vm1.png)

Réponse de la vm2 avec curl
![](/screenshots/curl-vm2.png)

Ressources créées dans Azure
VM1
![](/screenshots/vm1.png)

VM2
![](/screenshots/vm2.png)

LoadBalancer
![](/screenshots/lb.png)

#### 7. Destruction

RIP

![](/screenshots/destroy.png)
