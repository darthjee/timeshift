# frozen_string_literal: true

module Admin
  class SettupController < ApplicationController
    include OnePageApplication

    redirection_rule :redirect_root, :is_set?
    skip_redirection_rule :render_root, :is_set?

    def home
    end

    private

    def redirect_root
      '/#/'
    end

    def is_set?
      Settings.set
    end
  end
end
