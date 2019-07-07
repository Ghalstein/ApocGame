class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :destroy]

    def index
      @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def show
        @characters = @user.characters
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
  	    @user.destroy
  	    redirect_to new_user_path
    end


    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name)
    end

end
