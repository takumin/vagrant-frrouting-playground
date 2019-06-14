#
# Public Variables
#

unless node[:frrouting].kind_of?(Hash) then
  node[:frrouting] = {}
end

#
# Public Variables - Service Enabled
#

unless node[:frrouting][:enabled].kind_of?(Hash) then
  node[:frrouting][:enabled] = {}
end
unless node[:frrouting][:enabled][:bgpd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:bgpd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:bgpd] = false
end
unless node[:frrouting][:enabled][:ospfd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:ospfd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:ospfd] = false
end
unless node[:frrouting][:enabled][:ospf6d].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:ospf6d].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:ospf6d] = false
end
unless node[:frrouting][:enabled][:ripd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:ripd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:ripd] = false
end
unless node[:frrouting][:enabled][:ripngd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:ripngd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:ripngd] = false
end
unless node[:frrouting][:enabled][:isisd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:isisd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:isisd] = false
end
unless node[:frrouting][:enabled][:pimd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:pimd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:pimd] = false
end
unless node[:frrouting][:enabled][:ldpd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:ldpd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:ldpd] = false
end
unless node[:frrouting][:enabled][:nhrpd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:nhrpd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:nhrpd] = false
end
unless node[:frrouting][:enabled][:eigrpd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:eigrpd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:eigrpd] = false
end
unless node[:frrouting][:enabled][:babeld].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:babeld].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:babeld] = false
end
unless node[:frrouting][:enabled][:sharpd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:sharpd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:sharpd] = false
end
unless node[:frrouting][:enabled][:pbrd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:pbrd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:pbrd] = false
end
unless node[:frrouting][:enabled][:bfdd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:bfdd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:bfdd] = false
end
unless node[:frrouting][:enabled][:fabricd].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:fabricd].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:fabricd] = false
end
unless node[:frrouting][:enabled][:vtysh].kind_of?(FalseClass) ||
       node[:frrouting][:enabled][:vtysh].kind_of?(TrueClass) then
  node[:frrouting][:enabled][:vtysh] = true
end

#
# Public Variables - Service Options
#

unless node[:frrouting][:options].kind_of?(Hash) then
  node[:frrouting][:options] = {}
end
unless node[:frrouting][:options][:zebra].kind_of?(Array) then
  node[:frrouting][:options][:zebra] = ['-A', '127.0.0.1', '-s', '90000000']
end
unless node[:frrouting][:options][:bgpd].kind_of?(Array) then
  node[:frrouting][:options][:bgpd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:ospfd].kind_of?(Array) then
  node[:frrouting][:options][:ospfd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:ospf6d].kind_of?(Array) then
  node[:frrouting][:options][:ospf6d] = ['-A', '::1']
end
unless node[:frrouting][:options][:ripd].kind_of?(Array) then
  node[:frrouting][:options][:ripd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:ripngd].kind_of?(Array) then
  node[:frrouting][:options][:ripngd] = ['-A', '::1']
end
unless node[:frrouting][:options][:isisd].kind_of?(Array) then
  node[:frrouting][:options][:isisd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:pimd].kind_of?(Array) then
  node[:frrouting][:options][:pimd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:ldpd].kind_of?(Array) then
  node[:frrouting][:options][:ldpd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:nhrpd].kind_of?(Array) then
  node[:frrouting][:options][:nhrpd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:eigrpd].kind_of?(Array) then
  node[:frrouting][:options][:eigrpd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:babeld].kind_of?(Array) then
  node[:frrouting][:options][:babeld] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:sharpd].kind_of?(Array) then
  node[:frrouting][:options][:sharpd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:pbrd].kind_of?(Array) then
  node[:frrouting][:options][:pbrd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:staticd].kind_of?(Array) then
  node[:frrouting][:options][:staticd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:bfdd].kind_of?(Array) then
  node[:frrouting][:options][:bfdd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:fabricd].kind_of?(Array) then
  node[:frrouting][:options][:fabricd] = ['-A', '127.0.0.1']
end
unless node[:frrouting][:options][:watchfrr].kind_of?(Array) then
  node[:frrouting][:options][:watchfrr] = []
end

#
# Public Variables - Service Configuration
#

unless node[:frrouting][:config].kind_of?(Hash) then
  node[:frrouting][:config] = {}
end
unless node[:frrouting][:config][:zebra].kind_of?(Array) then
  node[:frrouting][:config][:zebra] = []
end
unless node[:frrouting][:config][:bgpd].kind_of?(Array) then
  node[:frrouting][:config][:bgpd] = []
end
unless node[:frrouting][:config][:ospfd].kind_of?(Array) then
  node[:frrouting][:config][:ospfd] = []
end
unless node[:frrouting][:config][:ospf6d].kind_of?(Array) then
  node[:frrouting][:config][:ospf6d] = []
end
unless node[:frrouting][:config][:ripd].kind_of?(Array) then
  node[:frrouting][:config][:ripd] = []
end
unless node[:frrouting][:config][:ripngd].kind_of?(Array) then
  node[:frrouting][:config][:ripngd] = []
end
unless node[:frrouting][:config][:isisd].kind_of?(Array) then
  node[:frrouting][:config][:isisd] = []
end
unless node[:frrouting][:config][:pimd].kind_of?(Array) then
  node[:frrouting][:config][:pimd] = []
end
unless node[:frrouting][:config][:ldpd].kind_of?(Array) then
  node[:frrouting][:config][:ldpd] = []
end
unless node[:frrouting][:config][:nhrpd].kind_of?(Array) then
  node[:frrouting][:config][:nhrpd] = []
end
unless node[:frrouting][:config][:eigrpd].kind_of?(Array) then
  node[:frrouting][:config][:eigrpd] = []
end
unless node[:frrouting][:config][:babeld].kind_of?(Array) then
  node[:frrouting][:config][:babeld] = []
end
unless node[:frrouting][:config][:sharpd].kind_of?(Array) then
  node[:frrouting][:config][:sharpd] = []
end
unless node[:frrouting][:config][:pbrd].kind_of?(Array) then
  node[:frrouting][:config][:pbrd] = []
end
unless node[:frrouting][:config][:staticd].kind_of?(Array) then
  node[:frrouting][:config][:staticd] = []
end
unless node[:frrouting][:config][:bfdd].kind_of?(Array) then
  node[:frrouting][:config][:bfdd] = []
end
unless node[:frrouting][:config][:fabricd].kind_of?(Array) then
  node[:frrouting][:config][:fabricd] = []
end
unless node[:frrouting][:config][:watchfrr].kind_of?(Array) then
  node[:frrouting][:config][:watchfrr] = []
end
unless node[:frrouting][:config][:frr].kind_of?(Array) then
  node[:frrouting][:config][:frr] = ['log syslog informational']
end
unless node[:frrouting][:config][:vtysh].kind_of?(Array) then
  node[:frrouting][:config][:vtysh] = ['service integrated-vtysh-config']
end

#
# Apt Repository
#

apt_keyring 'FRRouting Debian Repository <dev@lists.frrouting.org>' do
  finger '4A56C7738BB3F81595A805D2A832769908F13ED1'
  uri 'https://deb.frrouting.org/frr/keys.asc'
end

apt_keyring 'David Lamparter <equinox-debian@diac24.net>' do
  finger '3D9968AC9AE7BE1169288DDB1FD5839895F57FDA'
  uri 'https://deb.frrouting.org/frr/keys.asc'
end

apt_repository 'FRRouting Repository' do
  path '/etc/apt/sources.list.d/frrouting.list'
  entry [
    {
      :default_uri => 'https://deb.frrouting.org/frr',
      :mirror_uri  => "#{ENV['APT_REPO_URL_FRROUTING'] || node['apt-repo-url-frrouting']}",
      :suite       => '###platform_codename###',
      :components  => [
        'frr-stable',
      ],
    },
  ]
  notifies :run, 'execute[apt-get update]', :immediately
end

#
# Install Package
#

package 'frr'
package 'frr-pythontools'

#
# Admin VTY Shell
#

execute "usermod -aG frrvty #{node[:current][:user]}" do
  not_if "grep -qs '^frrvty.*#{node[:current][:user]}' /etc/group"
end

#
# Configuration Service
#

template '/etc/frr/daemons' do
  owner 'frr'
  group 'frr'
  mode  '0640'
end

node[:frrouting][:config].each do |key, val|
  if val.empty?
    file "/etc/frr/#{key}.conf" do
      action :delete
    end
  else
    template "/etc/frr/#{key}.conf" do
      owner 'frr'
      group 'frr'
      mode  '0640'
      variables(daemon: key, config: val)
      source 'templates/config.erb'
      notifies :run, 'execute[systemctl restart frr.service]'
    end
  end
end

service 'frr.service' do
  action [:enable, :start]
end

#
# Event Handler
#

execute 'apt-get update' do
  action :nothing
end

execute 'systemctl daemon-reload' do
  action :nothing
  subscribes :run, 'template[/etc/frr/daemons]'
end

execute 'systemctl restart frr.service' do
  action :nothing
  subscribes :run, 'template[/etc/frr/daemons]'
end
