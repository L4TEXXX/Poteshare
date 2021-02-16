class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def authenticate_user
        unless @current_user
            flash[:danger] = "ログインしてください"
            redirect_to login_path
        end
    end
end
