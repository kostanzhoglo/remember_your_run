class MonthsController < ApplicationController

  def show
    @month = Month.find_by(id: params[:id])
  end

  def create
    @month = Month.new(month_params)
    @month.save

    redirect_to month_url(@month)
  end

  private

    def month_params
      params.require(:month).permit(:name, :year, :goal)
    end

end
