init:
		rm -rf .terrafrom && terraform init

plan:
		terraform fmt -recursive && terraform plan

apply:
		terraform fmt -recursive && terraform apply

destroy:
		terraform destroy
