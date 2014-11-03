#Running Google Compute Quick Start using Terraform
##Installation and plan/apply steps
1. Make sure you have a google cloud services account and download the keys in json format and an ssh key for script execution. If you're at all unsure, it is suggested that you run through the quick start (available on the compute console) manually first and then use terraform to do the same. See https://cloud.google.com/storage/docs/authentication for details on authentication.
2. Install Terraform https://www.terraform.io/downloads.html It is avisable to read the good documentation https://www.terraform.io/intro/ and run through the AWS example for a good understanding of terraform.
3. Pull the configuration and scripts from this repo
4. Rename the terraform.tfvars.example to terraform.tfvars and update the variable values to reflect your keys and local files you got from step 1.
5. execute ```terraform plan``` to see what terraform will do and check that your variables are ok to at least connect to google cloud services.
6. execute ```terraform apply``` once complete you should be able to http://[front-end-public-ip]:8080 and see the todo app.
