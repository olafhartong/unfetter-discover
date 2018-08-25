Vagrant.configure("2") do |config|

  config.vm.define "unfetter" do |cfg|
    cfg.vm.box = "bento/ubuntu-16.04"
    cfg.vm.hostname = "unfetter"
    config.vm.provision :shell, path: "unfetter.sh"
    cfg.vm.network :private_network, ip: "192.168.38.2", gateway: "192.168.38.1", dns: "8.8.8.8"

    cfg.vm.provider "vmware_fusion" do |v, override|
      v.memory = 4096
      v.cpus = 2
      v.gui = true
    end

    cfg.vm.provider "vmware_workstation" do |v, override|
      v.memory = 4096
      v.cpus = 2
      v.gui = true
    end

    cfg.vm.provider "virtualbox" do |vb, override|
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", 4096]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      vb.customize ["modifyvm", :id, "--vram", "32"]
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end
  end
end
