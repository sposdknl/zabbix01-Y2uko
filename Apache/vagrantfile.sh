# Vagrantfile for Zabbix Server Installation
Vagrant.configure("2") do |config|
  # Define the base box (AlmaLinux 9)
  config.vm.box = "almalinux/9"

  # Set the VM hostname
  config.vm.hostname = "zabbix-server"

  # Networking: Forward ports for Apache (80) and SSH (22)
  config.vm.network "forwarded_port", guest: 80, host: 8080 # Zabbix frontend on localhost:8080
  config.vm.network "forwarded_port", guest: 22, host: 2222 # SSH access on localhost:2222

  # Configure VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048  # Allocate 2GB of RAM
    vb.cpus = 2       # Use 2 CPUs
  end

  # Provisioning with a Bash script
  config.vm.provision "shell", path: "provision.sh"

  # Optionally, provision with Ansible instead of Bash
  # Uncomment the following lines to use Ansible
  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "zabbix_playbook.yml"
  #   ansible.verbose = "v"
  # end
end
