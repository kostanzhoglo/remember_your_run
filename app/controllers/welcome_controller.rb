class WelcomeController < ApplicationController

  def home
    @calendars = Calendar.all
  end
  
end
