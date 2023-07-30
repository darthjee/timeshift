# frozen_string_literal: true

class ActiveSetting < ApplicationRecord
  validates :key,
            presence: true,
            length: { maximum: 50 },
            uniqueness: true,
            format: { with: /\A[a-z_][a-z0-9_]*\Z/ }
  validates :value,
            presence: true,
            length: { maximum: 255 }

  def key=(key)
    super(key&.to_s&.downcase)
  end
end
