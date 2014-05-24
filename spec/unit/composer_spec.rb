require 'spec_helper'

describe 'phpunit::composer' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:phpunit_dir) { "#{Chef::Config[:file_cache_path]}/phpunit" }

  before do
    stub_command("php -m | grep 'Phar'").and_return('')
  end

  it 'includes the composer recipe' do
    expect(chef_run).to include_recipe('composer')
  end

  it 'creates the PHPUnit director' do
    expect(chef_run).to create_directory(phpunit_dir)
  end

  it 'creates the composer.json file' do
    expect(chef_run).to create_template("#{phpunit_dir}/composer.json")
  end

  it 'runs phpunit-composer' do
    expect(chef_run).to run_execute('phpunit-composer')
  end
end
