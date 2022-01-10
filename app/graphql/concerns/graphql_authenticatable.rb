# frozen_string_literal: true

# GraphQlのObject, Resolver, Mutationで認証機能を提供するConcern
module GraphqlAuthenticatable
  extend ActiveSupport::Concern

  module GraphQLVisibility
    PUBLISHABLE = 'publishable'
    REQUIRE_AUTH = 'require_auth'
  end

  # class methods
  module ClassMethods
    def define_authorized_method
      define_singleton_method(:authorized?) do |_o, ctx|
        return true if graphql_name.include?('Payload')

        case __visibility
        when GraphQLVisibility::PUBLISHABLE
          return true
        when GraphQLVisibility::REQUIRE_AUTH
          return true if ctx[:current_account].present?
          fail ::Exceptions::UnauthorizedError unless ctx[:is_public_request]

          instance_eval do
            # 結局これでハックできるのはオフジェクトレベルでフィールドのnullチェックでエラーになる。。。
            def self.non_null?
              false
            end
          end
          return false
        else
          false
        end
      end
    end

    def publishable_visibility!
      self.__visibility = GraphQLVisibility::PUBLISHABLE
    end

    def require_auth_visibility!
      self.__visibility = GraphQLVisibility::REQUIRE_AUTH
    end
  end

  included do
    class_attribute :__visibility
    require_auth_visibility!
    define_authorized_method

    private

    def require_auth!
      fail ::Exceptions::UnauthorizedError unless current_account
    end
  end
end
