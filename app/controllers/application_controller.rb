class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  include Secured

  def require_login!
    authenticate_request!
  end

end
