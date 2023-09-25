# frozen_string_literal: true

module Admin
  class SettupController < ApplicationController
    include OnePageApplication

    redirection_rule :redirect_root, :set?
    skip_redirection_rule :render_root, :set?

    resource_for :settup, only: :index

    private

    def redirect_root
      '/#/'
    end

    def set?
      Settings.set
    end
  end
end
