# frozen_string_literal: true
require 'base64'

module Mutations
  # TempRegister
  class TempRegister < BaseMutation
    field :email, String, null: false

    argument :email, String, required: true

    def resolve(email:, **_args)
      token = Base64.strict_encode64(ENV.fetch("RAILS_MASTER_KEY"))
      json_data = "{\"email_verify_token\":\"#{token}\",\"email\":\"#{email}\"}"
      metadata = Base64.strict_encode64(json_data)
      AccountMailer.register_email(email, metadata)

      Rails.logger.info '====metadata====='
      Rails.logger.info metadata

      { email: email }
    end
  end
end
