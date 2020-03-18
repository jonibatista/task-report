class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authorize, :set_user

    protected
      def authorize
        unless User.find_by(id: session[:user_id])
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
