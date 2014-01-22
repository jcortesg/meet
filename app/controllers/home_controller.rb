class HomeController < ApplicationController
  def index
    @communities =  Community.all
    @meetings = Meeting.all
  end
end
