class ApplicationController < ActionController::Base
    helper_method :logged_in?
    
    def logged_in?
       session[:user_id] != nil ? true : false
    end
    
    def authenticate_user
        if !logged_in?
            flash[:alert] = "Invalid access!"
            redirect_to "/"
        end
    end
end
