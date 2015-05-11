include_recipe "duosecurity::#{node['duosecurity']['install_type']}"

# Config
directory "/etc/duo" do
  mode "0755"
  owner "root"
  group "root"
end

# https://www.duosecurity.com/docs/duounix#configuration-options
template "/etc/duo/login_duo.conf" do
  mode "0400"
  owner "root"
  group "root"
  source "login_duo.conf.erb"
  sensitive true
  variables(
    integration_key: node['duosecurity']['integration_key'],
    secret_key: node['duosecurity']['secret_key'],
    api_hostname: node['duosecurity']['api_hostname'],
    groups: node['duosecurity']['groups'],
    failmode: node['duosecurity']['failmode'],
    pushinfo: node['duosecurity']['pushinfo'],
    http_proxy: node['duosecurity']['http_proxy'],
    autopush: node['duosecurity']['autopush'],
    motd: node['duosecurity']['motd'],
    prompts: node['duosecurity']['prompts'],
    accept_env_factor: node['duosecurity']['accept_env_factor'],
    fallback_local_ip: node['duosecurity']['fallback_local_ip'],
    https_timeout: node['duosecurity']['https_timeout']
  )
end

# Enable login_duo and harden sshd
# https://www.duosecurity.com/docs/duounix#3.-enable-login_duo
sshd_directives = [
  "ForceCommand /usr/sbin/login_duo",
  "PermitTunnel no",
  "AllowTcpForwarding no"
]

sshd_directives.each do |directive|
  ruby_block "enable_login_duo_for_ssh" do
    block do
      fe = Chef::Util::FileEdit.new("/etc/ssh/sshd_config")
      fe.insert_line_if_no_match(/#{directive}/, directive)
      fe.write_file
    end
  end
end

