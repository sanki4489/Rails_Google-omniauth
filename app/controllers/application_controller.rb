class ApplicationController < ActionController::Base
    helper_method :current_user
    def welcome
        if !logged_in?
            redirect_to login_path
        end
    end

  private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        current_user
    end
end
