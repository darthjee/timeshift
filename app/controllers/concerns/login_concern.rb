module LoginConcern
  extend ActiveSupport::Concern

  def login(email)
    cookies.signed[:credentials] = email
  end
end
