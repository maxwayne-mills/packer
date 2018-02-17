buildfile=base.json

validate:
	packer validate $(buildfile)
image:
	:validate
	@echo "localhost	ansible_host=127.0.0.1 ansible_connection=local" > inventory
	packer build $(buildfile)
