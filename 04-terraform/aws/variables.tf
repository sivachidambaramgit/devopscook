
variable "cluster_name" { type = string  default = "devops-portfolio-eks" }
variable "region"       { type = string  default = "us-east-1" }
variable "node_instance_types" { type = list(string) default = ["t3.medium"] }
