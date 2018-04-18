class CalendarsController < ApplicationController

  def show
    @calendar = Calendar.find_by(id: params[:id])
  end

  def create
    @calendar = Calendar.new(params[:calendar])
    @calendar.save

    redirect_to calendar_url(@calendar)
  end

end
