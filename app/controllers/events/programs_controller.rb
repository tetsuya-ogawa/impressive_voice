class Events::ProgramsController < ApplicationController
  def edit
    @groups = Group.where(event_id: params[:event_id])
  end
end
