# frozen_string_literal: true
module Types
  # BaseObject
  class BaseObject < GraphQL::Schema::Object
    include GraphqlAuthenticatable
    include Helpers::ContextAccessHelper

    field_class Types::BaseField
    connection_type_class(Types::Connections::BaseConnectionType)
  end
end
