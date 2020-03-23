class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_user, :authorize

    protected
      def authorize
        unless @current_user
          redirect_to login_url, notice: 'Please login first'
        end
      end

    private
      def set_user
        @current_user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
        @current_user = nil
      end
end
