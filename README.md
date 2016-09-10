# Building custom RPM packages

The repositories that are part of this GitHub organization all have the following pre-requisites.

## Prerequisites

Install these on your local computer.

* Ruby 2.3 (use [RubyInstaller] for Windows, or [RVM] for Linux or OS X)
* [Python] 2.7.9 ≤ 3.0.0
* [Vagrant] 1.8+ (skip 1.8.5, which is broken)
    * Plus the [vagrant-cachier] plug-in to enable caching of `yum` packages.
    * Plus the [vagrant-hostsupdater] plug-in to enable automatic management of the `hosts` file.
* Virtual Machine software. _Choose one_ of the following:
    * [VirtualBox], for building the VirtualBox Vagrant box.
        * Plus the [vagrant-vbguest] plug-in to keep VirtualBox tools up-to-date.
    * [VMware Fusion], for building the VMware Vagrant box.
        * Plus the [Vagrant Provider for VMware] plug-in to enable Vagrant to use VMware as a provider.
    * [Parallels Desktop], for building the Parallels Vagrant box.
        * Plus the [Parallels Virtualization SDK for Mac] so that your Mac can talk to Parallels through Vagrant.
        * Plus the [vagrant-parallels] plug-in to enable Vagrant to use Parallels as a provider.

### Updating your Vagrant Plug-Ins

This is simply a good thing to do from time to time.

```bash
vagrant plugin update
```

## Bring-up the VM

1. Launch the Vagrant environment. This virtual machine is custom-designed for building CentOS 7 RPM packages, and is configured appropriately.

   ```bash
   vagrant up
   ```

1. Once it's running, log into the Vagrant environment.

   ```bash
   vagrant ssh
   ```

## Setting-Up Tooling

This VM assumes that you're hosting your package repo in Amazon S3. If not, feel free to install your preferred set of tools and configurations.

While the [Unified AWS Command-Line Tools](https://aws.amazon.com/cli/) are pre-installed, they are not pre-configured. Please follow the [Getting Started Guide](https://github.com/aws/aws-cli#getting-started) for configuring your tools.

### Syncing

There are a couple of scripts included which facilitate syncing new packages between S3 and your VM. See `sync-up.sh` and `sync-down.sh` for more information.

## Contributing

Here's the process for contributing:

1. Fork Rose to your GitHub account.
2. Clone your GitHub copy of the repository into your local workspace.
3. Write code, fix bugs, and add tests with 100% code coverage.
4. Commit your changes to your local workspace and push them up to your GitHub copy.
5. You submit a GitHub pull request with a description of what the change is.
6. The contribution is reviewed. Maybe there will be some banter back-and-forth in the comments.
7. If all goes well, your pull request will be accepted and your changes are merged in.

## Authors, Copyright & Licensing

* Copyright (c) 2016 [Ryan Parman](http://ryanparman.com).
* Copyright (c) 2016 [Lucky Rocketship Underpants, LLC](http://luckyrocketshipunderpants.com).

See also the list of [contributors](https://github.com/skyzyx/first-time-offender.com/contributors) who participated in this project.

  [Ansible]: http://docs.ansible.com/ansible/intro_installation.html
  [Parallels Desktop]: http://www.parallels.com/products/desktop/download/
  [Parallels Virtualization SDK for Mac]: http://www.parallels.com/download/pvsdk/
  [Python]: https://www.python.org/downloads/
  [RubyInstaller]: http://rubyinstaller.org
  [RVM]: http://rvm.io
  [Vagrant Provider for VMware]: https://www.vagrantup.com/vmware/
  [vagrant-cachier]: http://fgrehm.viewdocs.io/vagrant-cachier/
  [vagrant-hostsupdater]: https://github.com/cogitatio/vagrant-hostsupdater
  [vagrant-parallels]: http://parallels.github.io/vagrant-parallels/
  [vagrant-vbguest]: https://github.com/dotless-de/vagrant-vbguest
  [Vagrant]: https://www.vagrantup.com
  [VirtualBox]: https://www.virtualbox.org/wiki/Downloads
  [VMware Fusion]: http://www.vmware.com/products/fusion
