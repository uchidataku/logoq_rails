# frozen_string_literal: true

# authenticate_accountの提供
module Authenticatable
  extend ActiveSupport::Concern

  included do
    attr_reader :current_account

    def authenticate_account!
      @current_jwt = /[Bb]earer (.*)/.match(request.headers[:Authorization] || request.headers[:authorization]).to_a[1]
      fail Exceptions::UnauthorizedError, 'JWTが必要です' unless @current_jwt

      @current_account = Account.authenticate!(@current_jwt)
    end

    def authenticate_account
      authenticate_account!
    rescue StandardError
      nil
    end
  end
end
