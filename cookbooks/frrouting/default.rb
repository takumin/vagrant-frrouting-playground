apt_keyring 'FRRouting Debian Repository <dev@lists.frrouting.org>' do
  finger '4A56C7738BB3F81595A805D2A832769908F13ED1'
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
  notifies :run, "execute[apt-get update]", :immediately
end

execute 'apt-get update' do
  action :nothing
end

package 'frr'
package 'frr-pythontools'
