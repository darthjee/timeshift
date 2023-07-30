# frozen_string_literal: true

class ActiveSetting < ApplicationRecord
  validates :key,
            presence: true,
            length: { maximum: 50 }
  validates :key,
            uniqueness: true
  validates :value,
            presence: true,
            length: { maximum: 255 }
end
