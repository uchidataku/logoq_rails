# frozen_string_literal: true
module Types
  # AccountType
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :role, Enums::AccountRoleType, null: false

    field :created_at, DateTimeType, null: false
    field :updated_at, DateTimeType, null: false
  end
end
