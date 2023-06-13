# frozen_string_literal: true

require 'spec_helper'

describe Account do
  subject(:account) { build(:account) }

  describe 'validations' do
    it do
      expect(account).to belong_to(:user)
    end

    it do
      expect(account).to validate_presence_of(:name)
    end

    it do
      expect(account).to validate_length_of(:name)
        .is_at_most(255)
    end
  end
end
