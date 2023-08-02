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
      ENV[key.to_s.upcase] = value
    end
  end

  after do
    env_hash.each_key do |key|
      ENV.delete(key.to_s.upcase)
    end
  end

  describe 'password_salt' do
    context 'when nothing is set set' do
      let(:env_hash) do
        { timeshift_password_salt: nil }
      end

      it do
        expect(settings.password_salt).to be_nil
      end
    end

    context 'when only env is set' do
      let(:password_salt) { SecureRandom.hex(32) }

      let(:env_hash) do
        { timeshift_password_salt: password_salt }
      end

      it 'returns the value from env' do
        expect(settings.password_salt).to eq(password_salt)
      end
    end

    context 'when only db is set' do
      let(:password_salt) { SecureRandom.hex(32) }

      before do
        create(:active_setting, key: :password_salt, value: password_salt)
      end

      it 'returns the value from db' do
        expect(settings.password_salt).to eq(password_salt)
      end
    end

    context 'when env and db are set' do
      let(:password_salt) { SecureRandom.hex(32) }

      let(:env_hash) do
        { timeshift_password_salt: password_salt }
      end

      before do
        create(:active_setting, key: :password_salt)
      end

      it 'returns the value from env' do
        expect(settings.password_salt).to eq(password_salt)
      end
    end
  end
end
