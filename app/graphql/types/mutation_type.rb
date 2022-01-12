# frozen_string_literal: true
module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :temp_register, mutation: Mutations::TempRegister
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn
  end
end
