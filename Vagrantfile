Vagrant.configure("2") do |config|
  ips = ["192.168.50.11", "192.168.50.12"]

  (2..2).each do |i|
    config.vm.define "geocit-server#{i}" do |ubuntu|
      config.vm.box = "bento/ubuntu-22.04"
      ubuntu.vm.hostname = "geocit-server#{i}"
      ubuntu.vm.network "private_network", ip: ips[i-1]

      ubuntu.vm.provider "virtualbox" do |vb|
        vb.name = "geocit#{i}"
        vb.gui = false
        vb.memory = "2048"
        vb.cpus = 2
      end
      # If your VM boots too long, you can change this line to ensure connections
      ubuntu.vm.boot_timeout = 360
      ubuntu.ssh.insert_key = false
      
      # Provisioning necessary credentials
      ubuntu.vm.provision "file", source: "./credentials.sh", destination: "~/creds/credentials.sh"
      # Booting up first VM with main project structure
      if i == 1
        ubuntu.vm.provision "shell", path: "./startup_script.sh"
        ubuntu.vm.provision "file", source: "./credentials.sh", destination: "~/creds/credentials.sh"
      end

      # Booting up the second VM with DB
      if i == 2
        ubuntu.vm.provision "shell", privileged: true, path: "./db_server_script.sh"
      end
    end
  end
end
