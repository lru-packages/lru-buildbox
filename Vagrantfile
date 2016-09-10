Vagrant.require_version ">= 1.8.0"

environment_name = "BuildBox"
memsize = 2048
numvcpus = 2

Vagrant.configure("2") do | config |

  # Box
  config.vm.box = "skyzyx/centos7"
  config.vm.boot_timeout = 240

  # Networking
  config.vm.hostname = "buildbox"
  config.vm.network :private_network, ip: "33.33.33.33"
  config.ssh.forward_agent = true

  # Allow 20 seconds to gracefully halt (instead of 60)
  config.vm.graceful_halt_timeout = 20

  # Cache the yum packages locally if we can
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
    config.cache.auto_detect = true
    config.cache.enable :yum
  end

  # Check for vbguest plugin
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
    config.vbguest.no_remote = false
  end

  # Synced folders
  if Vagrant::Util::Platform.windows?
    config.vm.communicator = "winrm"
    config.vm.synced_folder "", "/vagrant", type: "smb"
    config.vm.synced_folder (File.expand_path '~'), "/home/vagrant/host", type: "smb"
  else
    config.vm.synced_folder "", "/vagrant", type: "nfs"
    config.vm.synced_folder (File.expand_path '~'), "/home/vagrant/host", type: "nfs"
  end

  # Oracle VirtualBox
  config.vm.provider :virtualbox do | vb |
    vb.name = environment_name
    vb.gui = false

    vb.memory = memsize
    vb.cpus = numvcpus
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # VMware Fusion
  config.vm.provider :vmware_fusion do | vm |
    vm.name = environment_name
    vm.gui = false
    vm.functional_hgfs = false

    vm.vmx["memsize"] = memsize
    vm.vmx["numvcpus"] = numvcpus
  end

  # Parallels Desktop
  config.vm.provider :parallels do | prl |
    prl.name = environment_name
    prl.update_guest_tools = true

    prl.memory = memsize
    prl.cpus = numvcpus
  end

  config.vm.provision :ansible do | ansible |
    ansible.playbook = "ansible/vm.yml"
    ansible.inventory_path = "ansible/inventories/buildbox"
    ansible.limit = "buildbox"
    ansible.verbose = true
  end
end
