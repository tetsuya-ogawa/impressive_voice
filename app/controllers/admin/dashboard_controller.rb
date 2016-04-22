
class Admin::DashboardController < ApplicationController
  def index
    @events = Event.all
  end
end