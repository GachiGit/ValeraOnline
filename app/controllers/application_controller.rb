# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def access_denied
    raise ActionController::RoutingError, 'Not Found'
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
