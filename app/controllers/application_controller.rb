class ApplicationController < ActionController::Base
  include LoginConcern

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing, with: :client_error

  def client_error
    head :bad_request
  end
end
