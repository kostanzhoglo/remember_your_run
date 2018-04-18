class WelcomeController < ApplicationController

  def home
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

end
