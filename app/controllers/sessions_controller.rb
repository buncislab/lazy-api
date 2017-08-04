class SessionsController < ApplicationController
	acts_as_token_authentication_handler_for User, only: [:destroy]
  def create
    @user = User.find_for_authentication(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password])
      render 'session', status: 200
    else
   		render json: { errors: "Invalid email or password" }, status: 422 
    end
  end

  def destroy
    current_user.generate_authentication_token!
    render json: {}, status: 204
  end
end
