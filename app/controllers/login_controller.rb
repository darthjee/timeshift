class LoginController < ApplicationController
  def create
    binding.pry
    User.find_or_create_by(user_params)
    login(email)
    render json: { redirect: home_path }
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
