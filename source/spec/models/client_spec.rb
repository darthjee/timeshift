# frozen_string_literal: true

require 'spec_helper'

describe Client do
  subject(:client) { build(:client) }

  describe 'validations' do
    it do
      expect(client).to belong_to(:user)
    end

    it do
      expect(client).to validate_presence_of(:name)
    end

    it do
      expect(client).to validate_length_of(:name)
        .is_at_most(255)
    end
  end
end
