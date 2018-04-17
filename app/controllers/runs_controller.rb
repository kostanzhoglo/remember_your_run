class RunsController < ApplicationController

  def index
    @runs = Run.all
  end

  def show
    @run = Run.find_by(id: params[:id])
  end

end
