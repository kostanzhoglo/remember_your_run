class MonthsController < ApplicationController
  before_action :authentication_required

  def index
    @months = current_user.months
    @month = Month.new
  end

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.new
    @runs = @month.runs
  end

  def create
    @month = Month.new(month_params)
    if @month.save
      redirect_to month_url(@month)
    else
      @months = current_user.months
      render :index
    end
  end

  private

    def month_params
      params.require(:month).permit(:name, :year, :goal)
    end

end
