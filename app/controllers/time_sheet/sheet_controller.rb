class TimeSheet::SheetController < ApplicationController
  def index
    render json: { sheets: sheets }
  end

  def show
  end

  def create
  end

  private

  def sheets
    TimeSheet::Sheet.where(user: logged_user)
  end
end
