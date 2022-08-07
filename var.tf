variable "region" {
  description = "My instance region"
  default     = "us-east-1"
}

variable "cluster" {
  description = "Name of my eks cluster"
  default     = "Aca-07-08-2022-classwork-cluster"
}

variable "cluster_version" {
  description = "My cluster version"
  default     = "1.22"
}

variable "cidr" {
  description = "vpc cidr_block"
  default     = "10.0.0.0/16"
}
