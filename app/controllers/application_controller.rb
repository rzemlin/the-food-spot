class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :require_login, :authorized_to_edit

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id] 
    end

    def require_login
        unless logged_in?
        flash[:message] = "You must be logged in to continue"
        redirect_to login_path    
        end
    end

    def authorized_to_edit

    end
    


end
