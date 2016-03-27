class Events::ProgramsController < ApplicationController
  def edit
    @groups = Group.where(event_id: params[:event_id]).rank(:order)
  end

  def sort
    band=params[:group]
    band_name=band[:name].strip
    group = Group.find_by(name: band_name)
    group.update(group_params)
    render nothing: true
  end

  private
    def group_params
      params.require(:group).permit(:name,:order_position,:event_id,:order)
    end
end
