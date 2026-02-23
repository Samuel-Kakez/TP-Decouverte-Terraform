variable "location" {
  description = "Région Azure"
  type        = string
  default     = "switzerlandnorth"
}

variable "prefix" {
  description = "Préfixe pour nommer les ressources"
  type        = string
  default     = "tp-azure"
}

variable "subscription_id" {
  description = "ID de la souscription Azure"
  type        = string
  sensitive   = true
}

variable "admin_ssh_public_key" {
  description = "Contenu de la clé publique SSH"
  type        = string
}