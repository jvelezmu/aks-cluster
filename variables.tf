variable "cluster_name" {
  default     = "aksdemoarc"
  description = "The name for the AKS cluster"
}

variable "env_name" {
  default     = "dev"
  description = "The environment for the AKS cluster"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable location {
    default = "East US"
}
variable "agent_count" {
    default = 1
}
