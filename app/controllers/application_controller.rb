class ApplicationController < ActionController::Base
    def cannot_do_when_logged_in
      if session[:user_id]
        redirect_to user_path(session[:user_id])
      end
    end

    def cannot_do_when_logged_out
      if !session[:user_id]
        redirect_to new_session_path
      end
    end
end
