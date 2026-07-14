terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Terraform provisiona el cluster minikube ejecutando el comando real.
# apply  -> minikube start   |   destroy -> minikube delete
resource "null_resource" "minikube_cluster" {
  provisioner "local-exec" {
    command = "minikube start --driver=docker"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "minikube delete"
  }
}
