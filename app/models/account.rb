# frozen_string_literal: true
# アカウント
class Account < ApplicationRecord
  include JWT::Authenticatable

  module Role
    CUSTOMER = 'customer'
    ADMIN = 'admin'
  end

  has_secure_password

  # Enum
  enum role: { customer: 0, admin: 1 }, _prefix: true

  # Validations
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
