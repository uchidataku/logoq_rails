# frozen_string_literal: true

module Types
  module Connections
    # BaseConnection
    class BaseConnectionType < GraphQL::Types::Relay::BaseConnection
      field :total_count, Int, null: false

      def total_count
        object.items.size
      end
    end
  end
end
