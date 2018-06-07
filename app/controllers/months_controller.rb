class MonthsController < ApplicationController
  before_action :authentication_required

  def index
    @months = current_user.months.uniq
    @month = Month.new
  end

  def show
    @month = current_user.months.find_by(id: params[:id])
    @run = Run.new
    @runs = @month.runs
    respond_to do |format|
      format.html
      format.json { render json: @month }  # because of AMS.
    end
  end

# Code below is a tip from @jeloslacks on slack. To help me put return value from a model method into my JSON so I can access it.
  # f.json {render :json => @month.to_json(:include => {:user => {:only => :username, :methods => [:gravatar_url_small]}})}

  def create
    @month = Month.new(month_params)
    if @month.save
      redirect_to month_url(@month)
    else
      @months = current_user.months
      render :index
    end
  end

  # def info
    # month = Month.find(params[:id])
    # render json: month
    # .to_json(include: :runs)
    # render plain: month.month_pace
  # end

  private

    def month_params
      params.require(:month).permit(:name, :year, :goal)
    end

end
