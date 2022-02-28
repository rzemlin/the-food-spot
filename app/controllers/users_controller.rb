class UsersController < ApplicationController

    def new
       @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id    #log them in
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        @restaurants = Restaurant.all
        # redirect_to users_path if !@user
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end