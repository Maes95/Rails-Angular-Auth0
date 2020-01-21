class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Secured

  def require_login!
    authenticate_request!
  end

end
