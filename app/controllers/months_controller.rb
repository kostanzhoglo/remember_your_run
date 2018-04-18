class MonthsController < ApplicationController

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.new      #Run.find_by(id: params[:id])        = @month.runs.build
    @runs = @month.runs        # OR, Run.all   --even though I know that's wrong.  The page rendered with that code.
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
