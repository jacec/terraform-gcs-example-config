variable "account_file" {}
variable "client_secrets_file" {}
variable "project" {}
variable "region" {
	default = "us-central1"
}
variable "ssh_username" {}
variable "ssh_key_file" {}
#Note: europe-west1-a has been deprecated, hence we're defaulting to europe-west1-b
variable "zones" {
	default {
		us-central1 = "us-central1-a"
		europe-west1 = "europe-west1-b"
		east-asia1 = "east-asia1-a"
	}
}