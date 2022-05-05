class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        users = User.all.select(:id, :email)
        render json: users
    end

    def show
        @user = User.where(id: params[:id]).or(User.where(username: params[:id]))
    end
end
