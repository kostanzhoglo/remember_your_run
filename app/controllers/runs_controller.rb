class RunsController < ApplicationController

  def create
    @month = Month.find(params[:month_id])
    @run = @month.runs.build(run_params)
    if @run.save
      redirect_to month_path(@month)
    else
      @month = Month.find(params[:month_id])
      @runs = @month.runs
      render 'months/show'
    end
  end

  def index
    if params[:month_id]
      @runs = Month.find(params[:month_id]).runs
    else
      @runs = Run.all
    end
  end

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.find_by(id: params[:id])
  end

  def edit
    @month = Month.find(params[:month_id])
    @run = Run.find_by(id: params[:id])
  end

  # /months/:month_id/runs/:id
  def update
    @month = Month.find(params[:month_id])
    @run = @month.runs.find(params[:id])
    if @run.update(run_params)
      redirect_to month_path(@month)
    else
      render :edit
    end
  end

  def destroy
    @month = Month.find(params[:month_id])
    @run = @month.runs.find(params[:id])
    @run.destroy
    redirect_to month_path(@run.month)
  end


  private

    def run_params
      params.require(:run).permit(:date, :name, :distance, :duration, :pace_per_mile, :notes, :number_intervals, :interval_length, :rest_between_interval, :month_id)
    end

end
