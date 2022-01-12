# frozen_string_literal: true

module Types
  module Interfaces
    # タイムスタンプのInterface
    module RecordType
      include BaseInterface

      field :created_at, DateTimeType, null: false
      field :updated_at, DateTimeType, null: false
    end
  end
end
