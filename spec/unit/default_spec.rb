require 'spec_helper'

describe 'phpunit::default' do
  let(:install_method) { 'composer' }

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:phpunit][:install_method] = install_method
    end.converge(described_recipe)
  end

  before do
    stub_command("php -m | grep 'Phar'").and_return('')
  end

  it 'includes the phpunit::composer recipe' do
    expect(chef_run).to include_recipe('phpunit::composer')
  end
end
