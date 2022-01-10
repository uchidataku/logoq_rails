# frozen_string_literal: true
require 'base64'

module Mutations
  # SignUp
  class SignUp < BaseMutation
    field :account, Types::AccountType, null: false
    field :token, String, null: false

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :password, String, required: true
    argument :metadata, String, required: true

    def resolve(metadata:, password:, **args)
      data = Base64.decode64(metadata)
      token = Base64.decode64(data[:email_verify_token])
      fail Exceptions::UnauthorizedError unless token == ENV.fetch('RAILS_MASTER_KEY')

      account = Account.new(email: data[:email], first_name: args[:first_name], last_name: args[:last_name])
      account.update!(password: password, password_confirmation: password)

      { account: account, token: account.jwt }
    end
  end
end
