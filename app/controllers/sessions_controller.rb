class SessionsController < ApplicationController
  skip_before_action :authorize_user, except: [:destroy]
  skip_after_action :verify_authorized

  def new
    redirect_to root_url if @current_user.present?
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome back #{user.name}"
    else
      session[:user_id] = nil
      flash[:notice] = 'invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
