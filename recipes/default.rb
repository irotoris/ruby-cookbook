src_file_path = "#{node['ruby']['install_dir']}/ruby-#{node['ruby']['version']}.tar.gz"

pkgs = %w{gcc zlib-devel openssl-devel libffi-devel make}

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
  not_if "ruby -v | grep #{node['ruby']['version']}"
end

link "/usr/bin/ruby" do
  to "/usr/local/bin/ruby"
end
  
