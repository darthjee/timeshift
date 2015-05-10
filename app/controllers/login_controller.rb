class LoginController < ApplicationController
  def create
    login(email)
  end

  def new
  end

  def destroy
  end

  private

  def email
    user[:email]
  end

  def user
    params.require(:user).permit(:email)
  end
end
