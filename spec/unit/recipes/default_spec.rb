#
# Cookbook Name:: lamp
# Spec:: default
#
# Copyright (c) 2022 The Authors, All Rights Reserved.

# require 'spec_helper'
require 'rspec'

describe 'lamp::default' do
  context 'When all attributes are default, on an Amazon 2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'amazon', version: '2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

