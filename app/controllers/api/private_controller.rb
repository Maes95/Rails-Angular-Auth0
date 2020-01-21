# frozen_string_literal: true
module Api
  class PrivateController < ApplicationController

    before_action :require_login!, only:[:private]

    def private
      render json: current_user
    end

  end
end
