
class Admin::DashboardController < AdminController
  def index
    @events = Event.all
  end
end