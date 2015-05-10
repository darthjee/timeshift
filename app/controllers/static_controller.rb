class StaticController < ApplicationController
  include HighVoltage::StaticPage
  layout :layout_for_page
end
