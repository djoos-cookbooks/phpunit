name 'phpunit'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures PHPUnit'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

%w(debian ubuntu redhat centos fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/phpunit' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/phpunit/issues' if respond_to?(:issues_url)

depends 'php'
depends 'git'
depends 'composer'

recipe 'phpunit', 'Installs phpunit.'
recipe 'phpunit::composer', 'Installs phpunit using composer.'
recipe 'phpunit::pear', 'Installs phpunit using pear.'
recipe 'phpunit::phar', 'Installs phpunit using phar.'
