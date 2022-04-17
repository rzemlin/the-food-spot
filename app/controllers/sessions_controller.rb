class SessionsController < ApplicationController

    def home
        @user = current_user
    end

    def new
    end

    def create  
        if (params[:user][:email]) == ""
            flash[:message] = "Invalid email or password, please try again."
            render '/sessions/new'
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:message] = "Sorry, something went wrong. Please try again. "
                redirect_to login_path
            end
        end
    end

    
    def destroy
        session.delete(:user_id)
        redirect_to "/"
    end
    
    def github
            @user =
              User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
              end
        
            session[:user_id] = @user.id
        
            render user_path(@user)
    end
        

    private

    def auth
        request.env['omniauth.auth']
    end

end