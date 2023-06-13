# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 255 }

  belongs_to :user
end
