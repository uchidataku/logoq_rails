# frozen_string_literal: true

module Resolvers
  # ログインしてるアカウントのリゾルバ
  class CurrentAccountResolver < BaseResolver
    type Types::AccountType, null: false

    def resolve
      current_account
    end
  end
end
