class LoginController < ApplicationController
  def create
    User.create(user_params)
    login(email)
  end

  def new
  end

  def destroy
  end

  private

  def email
    user_params[:email]
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
