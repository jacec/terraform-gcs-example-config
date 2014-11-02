# Configure the Google Cloud provider
provider "google" {
    account_file = "${var.account_file}"
    client_secrets_file = "${var.client_secrets_file}"
    project = "${var.project}"
    region = "${var.region}"
}

# Configure the Google compute instance for the frontend nodejs web server
# Note: The tag 'http-server' is used by the default network to allow HTTP traffic
resource "google_compute_instance" "front-end" {
    name = "front-end"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    tags = ["http-server"]

    disk {
        image = "debian-7-wheezy-v20141021"
    }

    network {
        source = "default"
    }

    metadata {
        capability = "web-server"
    }

    #copy installation file up to remote host
    provisioner "file" {
    	connection {
        	user = "${var.ssh_username}"
        	key_file = "${var.ssh_key_file}"
    	}

    	source = "install-front-end.sh"
    	destination = "/home/${var.ssh_username}/install-front-end.sh"
	}

	#chmod the install script and execute it
	#note: terraform's script command will do this, but as we're passing parameters, this was better option.
    provisioner "remote-exec" {
    	connection {
        	user = "${var.ssh_username}"
        	key_file = "${var.ssh_key_file}"
    	}
    	
        inline = [
        "chmod 777 ./install-front-end.sh",
        "./install-front-end.sh ${google_compute_instance.back-end.network.0.internal_address} ${google_compute_instance.front-end.network.0.internal_address}"
        ]
    }
}

# Configure the Google compute instance for the backend - mongodb server
# Note: The tag 'http-server' is used by the default network to allow HTTP traffic
resource "google_compute_instance" "back-end" {
    name = "back-end"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    tags = ["db-server"]

    disk {
        image = "debian-7-wheezy-v20141021"
    }

    network {
        source = "default"
    }

    metadata {
        capability = "db-server"
    }

    provisioner "remote-exec" {
    	connection {
        	user = "${var.ssh_username}"
        	key_file = "${var.ssh_key_file}"
    	}
        script = "install-back-end.sh"
    }
}