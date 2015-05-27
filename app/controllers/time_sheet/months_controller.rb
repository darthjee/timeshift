class TimeSheet::MonthsController < ApplicationController
  def index
    render json: sheet_month.to_json(include: :days)
  end

  private

  def sheet_month
    sheet.months.find_by(year: year, month: month)
  end

  def start_date
    @start_date ||= Date.new year, month, 1
  end

  def end_date
    @end_date ||= start_date + 1.month
  end

  def sheet
    TimeSheet::Sheet.find_by(user: logged_user, id: sheet_id)
  end

  def sheet_id
    params.require(:sheet_id)
  end

  def year
    params[:year].to_i
  end

  def month
    params[:month].to_i
  end
end
