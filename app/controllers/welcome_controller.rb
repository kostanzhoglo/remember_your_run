class WelcomeController < ApplicationController

  def home
    @months = Month.all
    @month = Month.new
  end

end
