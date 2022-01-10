# frozen_string_literal: true
module Types
  # QueryType
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Account
    field :current_account, resolver: Resolvers::CurrentAccountResolver
    field :accounts, resolver: Resolvers::AccountsResolver
  end
end
