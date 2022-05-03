class UserController < ApplicationController
    before_action :authenticate_user!
    def index
        users = User.all.select(:id, :email)
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
end
