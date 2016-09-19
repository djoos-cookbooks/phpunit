require 'spec_helper'
require 'pry'

describe 'phpunit::pear' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the PHP recipe' do
    expect(chef_run).to include_recipe('php')
  end
end
