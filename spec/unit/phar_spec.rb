require 'spec_helper'

describe 'phpunit::phar' do
  let(:install_dir) { '/tmp' }

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:phpunit][:install_dir] = install_dir
    end.converge(described_recipe)
  end

  it 'installs the bin in the install directory' do
    expect(chef_run).to create_remote_file("#{install_dir}/phpunit")
  end
end
