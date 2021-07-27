name 'phpunit'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures PHPUnit'
version '1.1.1'

%w(debian ubuntu redhat centos fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/phpunit'
issues_url 'https://github.com/djoos-cookbooks/phpunit/issues'

depends 'php'
depends 'git'
depends 'composer'
