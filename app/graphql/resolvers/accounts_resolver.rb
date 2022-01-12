# frozen_string_literal: true

module Resolvers
  # AccountsResolver
  class AccountsResolver < BaseResolver
    type Types::AccountType.connection_type, null: false

    def resolve(**_args)
      Account.all
    end
  end
end
