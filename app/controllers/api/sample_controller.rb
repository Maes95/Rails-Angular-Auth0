# frozen_string_literal: true
module Api
    class SampleController < ApplicationController

        before_action :require_login!, only:[:private]

        def private
            render json: current_user
        end

        def public
            render json: { message: 'You don\'t need to be authenticated to call this' }
        end

    end
end