# frozen_string_literal: true

module Types
  # AccountType
  class AccountType < Types::BaseObject
    implements GraphQL::Types::Relay::Node, Interfaces::RecordType

    global_id_field :id
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :role, Enums::AccountRoleType, null: false
  end
end
