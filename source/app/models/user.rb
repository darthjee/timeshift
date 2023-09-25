# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name, :login, :email, :encrypted_password
  has_many :sessions
  has_many :clients
  has_many :accounts

  validates :login,
            presence: true,
            length: { maximum: 50 }
  validates :email,
            presence: true,
            length: { maximum: 100 }
  validates :name,
            presence: true,
            length: { maximum: 100 }

  scope :admin, -> { where(admin: true) }

  def self.login(login:, password:)
    User.find_by!(login: login).verify_password!(password)
  rescue ActiveRecord::RecordNotFound
    raise Timeshift::Exception::LoginFailed
  end

  def password=(pass)
    self.salt = SecureRandom.hex
    self.encrypted_password = encrypt_password(pass)
  end

  def verify_password!(pass)
    return self if encrypted_password == encrypt_password(pass)

    raise Timeshift::Exception::LoginFailed
  end

  private

  def encrypt_password(pass)
    plain = salt + pass + Settings.password_salt
    Digest::SHA256.hexdigest(plain)
  end
end
