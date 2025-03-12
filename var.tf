variable "region" {
  description = "My instance region"
  default     = "us-west-1"
}

variable "cluster" {
  description = "Name of my eks cluster"
  default     = "test"
}

variable "cluster_version" {
  description = "My cluster version"
  default     = "1.30"
}

variable "cidr" {
  description = "vpc cidr_block"
  default     = "10.0.0.0/16"
}
