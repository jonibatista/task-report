class SessionsController < ApplicationController
    skip_before_action :authorize, except: [:destroy]
  
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
        flash[:notice] = 'invalid email or password'
        render 'new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to login_url
    end
end
