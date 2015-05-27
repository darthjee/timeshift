class TimeSheet::SheetController < ApplicationController
  def index
    render json: { sheets: sheets }
  end

  def show
    respond_to do |format|
      format.html { render :show, locals: { sheet_id: sheet_id } }
      format.json { render(json: sheet) }
    end
  end

  def create
  end

  private

  def sheets
    TimeSheet::Sheet.where(user: logged_user)
  end

  def sheet
    TimeSheet::Sheet.find_by(user: logged_user, id: sheet_id)
  end

  def sheet_id
    params.require(:id)
  end
end
