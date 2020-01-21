# frozen_string_literal: true
module Secured
  extend ActiveSupport::Concern

  # included do
  #   before_action :authenticate_request!
  # end

  def current_user
    @auth_payload
  end

  def authenticate_request!
    @auth_payload, @auth_header = auth_token
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end

end
