module Admin
  module Controllers
    class Base < ActionController::Base
      respond_to :html

      protect_from_forgery
      before_filter :authenticate_admin_user!
      layout proc{ |c| c.request.xhr? ? false : 'activo' }
      attr_reader :resource
      helper_method :resource, :current_admin_user

      def self.template_lookup_path(param = nil)
        paths = super(param)
        paths << 'admin/base'
      end

      def current_admin_user
        session[:admin_user]
      end

      protected

      def authenticate_admin_user!
        redirect_to new_admin_user_session_path unless session[:admin_user]
      end

      # TODO Remove this maybe?
      def respond_with(*args)
        @resource = [:admin] + args
        super(*(@resource))
      end

    end
  end
end
