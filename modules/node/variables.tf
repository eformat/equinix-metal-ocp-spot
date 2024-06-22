variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "cluster_basedomain" {
  description = "Cluster base domain"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
}

variable "plan" {
  description = "Device plan"
  type        = string
}

variable "metro" {
  description = "Metro location"
  type        = string
}

variable "project_id" {
  description = "Equinix Metal project ID"
  type        = string
}

variable "bastion_ip" {
  description = "Bastion IP address"
  type        = string
}

variable "node_type" {
  description = "Node type"
  type        = string
}

variable "depends" {
  description = "Dependencies"
  type        = list(any)
}

variable "max_bid_price" {
  description = "Maximum bid price for spot instances"
  type        = number
}

variable "ssh_key_id" {
  description = "SSH key ID"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}
