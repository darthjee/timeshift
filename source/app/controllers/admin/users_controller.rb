# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    include OnePageApplication

    protect_from_forgery except: %i[create update]

    resource_for :user,
                 decorator: User::InternalDecorator,
                 paginated: true,
                 per_page: 10

    private

    def user_params
      params.permit(
        *%w[name login email password admin]
      )
    end
  end
end
