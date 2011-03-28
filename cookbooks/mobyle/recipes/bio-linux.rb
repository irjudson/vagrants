#
# Cookbook Name:: bio-linux
# Recipe:: bio-linux
#
# Copyright 2011, Ivan R. Judson
#
# All rights reserved - Do Not Redistribute
#

#
# Also to install: siginterrupt, golden, squizz, mobyle xml files and
# Mobyle itself.
#

package "python-4suite-xml"
package "python-simpletal"
package "python-imaging"
package "python-libxml2"
package "python-dnspython"
package "python-simplejson"

mobyle_path = "/usr/local/mobyle-0.97.2"
cgi_path    = "/usr/lib/cgi-bin/mobyle"
doc_path    = "/var/www/mobyle"

python_pip "http://releases.navi.cx/pycaptcha/pycaptcha-0.4.tar.bz2" do
  action :install
end

python_pip "ftp://ftp.pasteur.fr/pub/gensoft/projects/mobyle/siginterrupt-1.0.tar.gz" do
  action :install
end

script "open /usr/local" do
  interpreter "bash"
  user "root"
  code <<-EOH
  chgrp -R www-data /usr/local
  chmod -R g+rwx /usr/local
  EOH
end

script "install_squizz" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget ftp://ftp.pasteur.fr/pub/gensoft/projects/squizz/squizz-0.99a.tar.gz
  tar -zxf squizz-0.99a.tar.gz
  cd squizz-0.99a
  ./configure
  make
  make install
  EOH
end

script "install_golden" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget ftp://ftp.pasteur.fr/pub/gensoft/projects/golden/golden-1.1a.tar.gz
  tar -zxf golden-1.1a.tar.gz
  cd golden-1.1a
  ./configure
  make
  make install
  EOH
end

script "install_mobyle" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget ftp://ftp.pasteur.fr/pub/gensoft/projects/mobyle/Mobyle-0.97.2.tar.gz
  tar -zxf Mobyle-0.97.2.tar.gz
  cd Mobyle-0.97.2
  python setup.py install --install-core=/usr/local/mobyle-0.97.2 --install-cgis=/usr/lib/cgi-bin/mobyle --install-htdocs=/var/www/mobyle
  EOH
end

script "open /var/www" do
  interpreter "bash"
  user "root"
  code <<-EOH
  chgrp -R www-data /var/www
  chmod -R g+rwx /var/www
  EOH
end

script "open /usr/lib/cgi-bin" do
  interpreter "bash"
  user "root"
  code <<-EOH
  chgrp -R www-data /usr/lib/cgi-bin
  chmod -R g+rwx /usr/lib/cgi-bin
  EOH
end

template "/usr/local/mobyle-0.97.2/Local/Config/Config.py" do
  source "Config.py.erb"
  mode 0755
end

script "install_mobyle_programs_and_workflows" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget ftp://ftp.pasteur.fr/pub/gensoft/projects/mobyle/Programs-1.3.tgz
  tar -zxf Programs-1.3.tgz
  cp -r /tmp/Programs-1.3/* /usr/local/mobyle-0.97.2/Programs/
  /usr/local/mobyle-0.97.2/Tools/mobdeploy deploy
  EOH
end

script "check_ownership_of_mobyle_programs" do
  interpreter "bash"
  user "root"
  code <<-EOH
  chgrp -R www-data /usr/local/mobyle-0.97.2/Programs
  chmod -R g+rwx /usr/local/mobyle-0.97.2/Programs
  EOH
end


