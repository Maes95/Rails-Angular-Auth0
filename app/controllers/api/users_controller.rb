module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :require_login!, except:[:index, :show]

    # GET /users
    def index
      @users = User.all.to_json(only: [:id, :email, :name])

      render json: @users
    end

    # GET /users/1
    def show
      render json: @user.to_json(only: [:id, :email, :name])
    end

    # GET /users/me
    def me
      render json: current_user
    end

    # GET /users/exists
    def exists
      render json: current_user != nil
    end

    # POST /users
    def create
      @user = User.new(user_params)
      @user.auth0_id = current_auth0_id

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :email)
      end
  end
end
