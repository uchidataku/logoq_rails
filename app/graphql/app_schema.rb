# frozen_string_literal: true
# AppSchema
class AppSchema < GraphQL::Schema
  include ::GraphqlExceptionHandler

  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Batch
  connections.add ActiveRecord::Result, GraphQL::Relay::ArrayConnection

  class << self
    def resolve_type(_abstract_type, obj, _ctx)
      Types.const_get("#{obj.class}Type")
    end

    def id_from_object(object, _type = nil, _ctx = {})
      self::UniqueWithinType.encode(object.class.name, object.id, separator: ':')
    end

    def object_from_id(node_id, _ctx = {})
      type_name, object_id = self::UniqueWithinType.decode(node_id, separator: ':')
      Object.const_get(type_name).find(object_id)
    end
  end
end
