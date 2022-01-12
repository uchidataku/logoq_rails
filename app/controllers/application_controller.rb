# frozen_string_literal: true
# ApplicationController
class ApplicationController < ActionController::API
  include ExceptionHandler
  include Authenticatable

  before_action :authenticate_account!
end
