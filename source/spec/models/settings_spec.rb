# frozen_string_literal: true

require 'spec_helper'

describe Settings do
  subject(:settings) do
    Class.new(described_class).tap do |klass|
      klass.send(:source, :env, Class.new(EnvSettings))
      klass.send(:source, :db,  Class.new(ActiveSettings))
    end
  end

  let(:env_hash) { {} }

  before do
    env_hash.each do |key, value|
      ENV[key.to_s.upcase] = value&.to_s
    end
  end

  after do
    env_hash.each_key do |key|
      ENV.delete(key.to_s.upcase)
    end
  end

  describe '.password_salt' do
    it_behaves_like "a setting", :password_salt
  end

  describe '.hex_code_size' do
    it_behaves_like "a setting", :hex_code_size do
      let(:default_value) { 16 }
      let(:value)         { Random.rand(10..15) }
    end
  end
end
