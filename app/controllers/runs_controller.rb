class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def show
    @month = Month.find_by(id: params[:id])
    @run = Run.find_by(id: params[:id])
  end

end
