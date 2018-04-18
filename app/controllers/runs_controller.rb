class RunsController < ApplicationController


  def create
    @month = Month.find(params[:month_id])
    @run = @month.runs.build(run_params)
    @run.save
    redirect_to month_path(@month)
  end

  def index
    @runs = Run.all
  end

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.find_by(id: params[:id])
  end


  private

    def run_params
      params.require(:run).permit(:date, :name, :distance, :duration, :pace_per_mile, :notes, :number_intervals, :interval_length, :rest_between_interval)
    end

end
