
variable "cluster_name" { type = string }
variable "region" { type = string }
variable "node_instance_types" { type = list(string) default = ["t3.medium"] }
