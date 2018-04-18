class CalendarsController < ApplicationController

  def show
    @calendar = Calendar.find_by(id: params[:id])
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.save

    redirect_to calendar_url(@calendar)
  end

  private

    def calendar_params
      params.require(:calendar).permit(:name, :year, :goal)
    end

end
