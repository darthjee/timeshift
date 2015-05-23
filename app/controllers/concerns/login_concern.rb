module LoginConcern
  extend ActiveSupport::Concern

  def login(email)
    cookies.signed[:credentials] = email
  end

  def user
    @user ||= User.find_by(email: user_credentials) if user_credentials
  end

  def logged?
    user.present?
  end

  private

  def user_credentials
    @user_credentials ||= cookies.signed[:credentials]
  end
end
