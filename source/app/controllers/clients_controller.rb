# frozen_string_literal: true

# Controller for creating, listing and viewing {Simulation}
#
# This controller use basic CRUD methods
class ClientsController < ApplicationController
  include OnePageApplication
  include LoggedUser

  protect_from_forgery except: [:create]

  resource_for :client,
               paginated: true,
               per_page: 10

  private

  def clients
    logged_user.clients
  end
end
