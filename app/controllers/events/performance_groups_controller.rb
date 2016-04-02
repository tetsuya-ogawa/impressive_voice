class Events::PerformanceGroupsController < ApplicationController
  def index
    @performance_groups = Events::PerformanceGroup.all
  end
end
