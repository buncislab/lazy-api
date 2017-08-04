class SessionsController < ApplicationController
  def create
    @user = User.find_for_authentication(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password])
      render 'session', status: 200
    else
   		render json: { errors: "Invalid email or password" }, status: 422 
    end
  end

  def destroy
  end
end
