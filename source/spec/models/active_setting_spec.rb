# frozen_string_literal: true

require 'spec_helper'

describe ActiveSetting do
  subject(:active_setting) { build(:active_setting) }

  describe 'validations' do
    it do
      expect(active_setting).to validate_presence_of(:key)
    end

    it do
      expect(active_setting).to validate_uniqueness_of(:key)
        .case_insensitive
    end

    it do
      expect(active_setting).to validate_length_of(:key)
        .is_at_most(50)
    end

    it do
      expect(active_setting).to validate_presence_of(:value)
    end

    it do
      expect(active_setting).to validate_length_of(:value)
        .is_at_most(255)
    end
  end

  describe 'key=' do
    subject(:active_setting) do
      build(:active_setting, key: key)
    end

    context 'when the value is upcase' do
      let(:key) { 'SOME_KEY' }

      it 'converts to lowercase' do
        expect(active_setting.key).to eq('some_key')
      end
    end

    context 'when the value is nil' do
      let(:key) { nil }

      it do
        expect(active_setting.key).to be_nil
      end
    end

    context 'when the value is a symbol' do
      let(:key) { :some_key }

      it 'converts to string' do
        expect(active_setting.key).to eq('some_key')
      end
    end
  end
end
