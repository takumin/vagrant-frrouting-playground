# vim: set ft=ruby :

require 'open-uri'
require 'yaml'

# MItamae Github Release Tag
MITAMAE_RELEASE_TAG ||= 'v1.7.5'

# MItamae CookBooks
MITAMAE_COOKBOOKS = [
  'cookbooks/apt/default.rb',
  'cookbooks/sudo/default.rb',
  'cookbooks/require/default.rb',
  'cookbooks/frrouting/default.rb',
]

# Download Require Binary
[
  {
    :name => 'mitamae',
    :urls => [
      "https://github.com/itamae-kitchen/mitamae/releases/download/#{MITAMAE_RELEASE_TAG}/mitamae-x86_64-linux",
    ],
  },
].each {|item|
  base_dir = File.join(File.expand_path(__dir__), 'vendor', item[:name])
  unless File.exist?(base_dir)
    Dir.mkdir(base_dir, 0755)
  end
  item[:urls].each {|url|
    path = File.join(base_dir, File.basename(url))
    unless File.exist?(path)
      p "Download: #{url}"
      open(url) do |file|
        open(path, 'w+b') do |out|
          out.write(file.read)
        end
      end
    end
  }
}

# Require Minimum Vagrant Version
Vagrant.require_version '>= 2.2.4'

# Vagrant Configuration
Vagrant.configure('2') do |config|
  # Multi Machine
  Dir.glob('config/*.yaml').each do |file|
    # Filename Hostname
    hostname = File.basename(file, '.*')

    # Loading YAML
    yaml = YAML.load_file(file)

    # Check Networks
    if yaml.key?('network') and yaml['network'].size > 0
      config.vm.define "#{hostname}" do |domain|
        # Require Plugins
        domain.vagrant.plugins = ['vagrant-libvirt']

        # Ubuntu 18.04 Box
        domain.vm.box = 'ubuntu1804'
        domain.vm.box_url = 'https://github.com/takumin/vagrant-box-libvirt-ubuntu/releases/download/v0.0.3/ubuntu-amd64-bionic-libvirt.box'

        # Hostname
        domain.vm.hostname = "vagrant-#{hostname}"

        # Private Network
        yaml['network'].each do |nw|
          domain.vm.network :private_network,
            :ip => nw['addr'],
            :libvirt__netmask => nw['mask'],
            :libvirt__network_name => nw['name'],
            :libvirt__dhcp_enabled => false,
            :libvirt__forward_mode => 'none',
            :libvirt__guest_ipv6 => 'no'
        end

        # Synced Directory
        if ENV['NFS_MOUNT_DIR'] then
          # NFS Mount
          domain.vm.synced_folder ENV['NFS_MOUNT_DIR'], '/vagrant',
            type: 'nfs',
            nfs_version: 4,
            nfs_udp: false
        else
          # Rsync Copy
          domain.vm.synced_folder '.', '/vagrant',
            type: 'rsync',
            rsync__exclude: ['.git/']
        end

        # Libvirt Provider Configuration
        domain.vm.provider :libvirt do |libvirt|
          # CPU
          libvirt.cpus = 2
          # Memory
          libvirt.memory = 2048
          # Monitor
          libvirt.graphics_type = 'spice'
          libvirt.graphics_ip = '127.0.0.1'
          libvirt.video_type = 'qxl'
          # Network
          libvirt.management_network_mode = 'nat'
          libvirt.management_network_guest_ipv6 = 'no'
        end

        # MItamae Install
        domain.vm.provision 'shell' do |shell|
          shell.name   = 'Install mitamae'
          shell.inline = <<~BASH
            if ! mitamae version > /dev/null 2>&1; then
              install -o root -g root -m 0755 /vagrant/vendor/mitamae/mitamae-x86_64-linux /usr/local/bin/mitamae
            fi
          BASH
        end

        # MItamae Provision
        domain.vm.provision 'shell' do |shell|
          shell.name   = 'Provision mitamae'
          shell.env = {
            'no_proxy'                 => ENV['no_proxy'] || ENV['NO_PROXY'],
            'NO_PROXY'                 => ENV['no_proxy'] || ENV['NO_PROXY'],
            'ftp_proxy'                => ENV['ftp_proxy'] || ENV['FTP_PROXY'],
            'FTP_PROXY'                => ENV['ftp_proxy'] || ENV['FTP_PROXY'],
            'http_proxy'               => ENV['http_proxy'] || ENV['HTTP_PROXY'],
            'HTTP_PROXY'               => ENV['http_proxy'] || ENV['HTTP_PROXY'],
            'https_proxy'              => ENV['https_proxy'] || ENV['HTTPS_PROXY'],
            'HTTPS_PROXY'              => ENV['https_proxy'] || ENV['HTTPS_PROXY'],
            'APT_REPO_URL_UBUNTU'      => ENV['APT_REPO_URL_UBUNTU'],
            'APT_REPO_URL_PARTNER'     => ENV['APT_REPO_URL_PARTNER'],
            'APT_REPO_URL_JA'          => ENV['APT_REPO_URL_JA'],
            'APT_REPO_URL_JA_NON_FREE' => ENV['APT_REPO_URL_JA_NON_FREE'],
            'APT_REPO_URL_FRROUTING'   => ENV['APT_REPO_URL_FRROUTING'],
          }
          shell.inline = <<~BASH
            cd /vagrant
            mitamae local -y #{file} helpers/keeper.rb #{MITAMAE_COOKBOOKS.join(' ')}
          BASH
        end
      end
    end
  end
end
