# frozen_string_literal: true
module Mutations
  # BaseMutation
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include Helpers::ContextAccessHelper
    include GraphqlAuthenticatable

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject
  end
end
