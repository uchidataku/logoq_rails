# frozen_string_literal: true
module Types
  module Enums
    # AccountRoleType
    class AccountRoleType < Types::BaseEnum
      value 'CUSTOMER', value: Account::Role::CUSTOMER
      value 'ADMIN', value: Account::Role::ADMIN
    end
  end
end
