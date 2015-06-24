src_file_path = "#{node['ruby']['install_dir']}/ruby-#{node['ruby']['version']}.tar.gz"

pkgs = %w{gcc zlib-devel openssl-devel sqlite sqlite-devel mysql-devel readline-devel libffi-devel make}

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file src_file_path do
  source node['ruby']['src']
end

bash "compile and install ruby" do
  cwd node['ruby']['install_dir']
  code <<-EOH
    tar zxvf ruby-#{node['ruby']['version']}.tar.gz
    cd ruby-#{node['ruby']['version']}
    ./configure
    make
    make install
  EOH
  notifies :create, "link[/usr/bin/ruby]"
  not_if "ruby -v | grep #{node['ruby']['version']}"
end

link "/usr/bin/ruby" do
  to "/usr/local/bin/ruby"
  action :nothing
end
  
