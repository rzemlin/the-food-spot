class SessionsController < ApplicationController

    def home
        @user = current_user
    end

    def new
    end

    def create     #does the user exist in our system
        if (params[:user][:email]) == "" || (params[:user][:password]) == ""
            flash[:message] = "Invalid email or password, please try again."
            redirect_to login_path
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password ])
                        #compares your password to the hashed version in password_digest column
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
        
        def github_omniauth
    @user =
      User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end

    session[:user_id] = @user.id

    render 'users/show/'
  end


   private
    
      def auth
        request.env['omniauth.auth']
      end
end