# frozen_string_literal: true

module Types
  module Interfaces
    # BaseInterface
    module BaseInterface
      include GraphQL::Schema::Interface

      field_class Types::BaseField
      connection_type_class Types::Connections::BaseConnectionType
    end
  end
end
