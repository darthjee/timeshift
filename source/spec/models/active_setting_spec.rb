# frozen_string_literal: true

require 'spec_helper'

describe ActiveSetting do
  subject(:active_setting) { build(:active_setting) }

  describe 'validations' do
    it do
      expect(active_setting).to validate_presence_of(:key)
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
end
