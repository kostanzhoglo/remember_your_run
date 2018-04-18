class CalendarsController < ApplicationController

  def show
    @calendar = Calendar.find_by(id: params[:id])
  end

end
