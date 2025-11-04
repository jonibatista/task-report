class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  attr_reader :current_user

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from StandardError, with: :unexpected_error
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authorize_user

  after_action :verify_authorized

  protected

  def authorize_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to login_url, notice: 'please login first'
  end

  private

  def record_not_found(exception)
    logger.error "User #{@current_user&.id} fails to retrive record #{exception.id} from model #{exception.model}"
    render(file: File.join(Rails.root, 'public/404.html'), status: :not_found, layout: false)
  end
  
  def unexpected_error(exception)
    logger.fatal "User #{@current_user&.id} raises #{exception}"
    render(file: File.join(Rails.root, 'public/404.html'), status: :not_found, layout: false)
  end

  def user_not_authorized(exception)
    logger.error "User #{@current_user&.id} is not authorized to #{exception.policy.class.to_s.underscore}.#{exception.query}"
    redirect_to root_url, notice: 'You cannot perform this action.'
  end
end
