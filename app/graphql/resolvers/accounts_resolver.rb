# frozen_string_literal: true

module Resolvers
  # Account検索のリゾルバ
  class AccountsResolver < BaseResolver
    type Types::AccountType.connection_type, null: false

    def resolve(**_args)
      Account.all
    end
  end
end
