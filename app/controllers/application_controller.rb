class ApplicationController < ActionController::Base
    helper_method :logged_in?
    
    def logged_in?
       return true if session[:user_id]
    end
end
