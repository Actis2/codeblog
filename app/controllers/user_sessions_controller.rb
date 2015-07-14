class UserSessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user_id
  		flash[:success] = "Thanks for logging in!"
  		redirect_to articles_path
  	else
  		flash[:error] = "Sorry, there was a problem logging in. Please check your email and password."
  		render action: 'new'
  	end
  end
end
