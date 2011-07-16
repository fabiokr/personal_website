module Admin
  class UserSessionsController < ApplicationController

    layout 'login'
    helper_method :resource

    # GET /resource/sign_in
    def new
      if session[:admin_user]
        redirect_to admin_dashboard_path
      end
    end

    def create
      if session[:admin_user]
        redirect_to admin_dashboard_path
      else
        @user = AdminUser.find_for_google_apps(env["omniauth.auth"])

        if @user && @user.persisted?
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google Apps"
          session[:admin_user] = @user
          redirect_to admin_dashboard_path
        else
          flash[:error] = I18n.t "devise.omniauth_callbacks.failure", :kind => "Google Apps", :reason => "your user do not have permission"
          redirect_to new_admin_user_session_url
        end
      end
    end

    # GET /resource/sign_out
    def destroy
      if session[:admin_user]
        session.delete :admin_user
        flash[:notice] = I18n.t 'devise.sessions.signed_out'
      end

      redirect_to new_admin_user_session_url
    end

    def resource
      
    end
  end
end