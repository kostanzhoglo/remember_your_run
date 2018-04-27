class RunsController < ApplicationController
  before_action :authentication_required
  before_action :set_month, only: [:create, :edit, :update, :destroy]

  def create
    @run = @month.runs.build(run_params)
    @run[:user_id] = current_user.id
    @run[:pace_per_mile] = @run.format_pace_per_mile
    if @run.save
      # @run[:pace_per_mile] = @run.format_pace_per_mile
      # @run.update(run_params)
      redirect_to month_path(@month)
    else
      # if @run.distance == 99999999
      #   flash[:error] = "Make sure to enter a number for Distance"
      # end
      # if @run.duration == "99:59:59"
      #   flash[:error] = "Make sure to enter a time (example 40:00) for Duration."
      # end
      @month = Month.find(params[:month_id])
      @runs = @month.runs
      render 'months/show'
    end
  end

  def index
    @user = current_user
    if params[:month_id]
      @runs = @user.months.find(params[:month_id]).runs
    else
      @runs = @user.runs.all
    end
  end

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.find_by(id: params[:id])
  end

  def edit
    @run = Run.find_by(id: params[:id])
  end

  def update
    @run = @month.runs.find(params[:id])
    if @run.update(run_params)
      @run.update_attributes({:pace_per_mile => @run.format_pace_per_mile})
      redirect_to month_path(@month)
    else
      render :edit
    end
  end

  def destroy
    @run = @month.runs.find(params[:id])
    @run.destroy
    redirect_to month_path(@run.month)
  end

  def fastest_pace
    @runs = Run.fastest_pace
  end

  def longest_runs
    @runs = Run.longest_runs
  end

  private
    def set_month
      @month = Month.find(params[:month_id])
    end

    def run_params
      params.require(:run).permit(:date, :name, :distance, :duration, :pace_per_mile, :notes, :number_intervals, :interval_length, :rest_between_interval, :month_id)
    end

end
