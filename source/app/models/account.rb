# frozen_string_literal: true

class Account < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 255 }

  belongs_to :user
end
