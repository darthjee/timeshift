class StaticController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  def layout_for_page
    params[:ajax] ? false : 'application'
  end
end