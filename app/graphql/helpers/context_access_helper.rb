# frozen_string_literal: true

module Helpers
  # ContextAccessHelper
  module ContextAccessHelper
    extend ActiveSupport::Concern

    included do
      def current_account
        context[:current_account]
      end
    end
  end
end
