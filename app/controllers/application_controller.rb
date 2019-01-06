# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Knock::Authenticable
end
