class Events::ProgramsController < ApplicationController
  def edit
    #order_position_init
    @groups = Group.where(event_id: params[:event_id]).rank(:order)
  end

  def sort
    band=params[:group]
    band_info=band[:name].split
    band_name=band_info[0]
    group = Group.find_by(name: band_name)

    test1=params[:group][:order_position]
    test2=count_before_events_groups(group)

    group.order_position = params[:group][:order_position].to_i + count_before_events_groups(group)
    group.save
    #group.update(group_params)
    render nothing: true
  end

  private
    def group_params
      params.require(:group).permit(:order_position)
    end

    def count_before_events_groups(group)
      before_events_groups = 0
      events = Event.where('id < ?', group.event_id)
      events.each do |event|
        before_events_groups += event.groups.count
      end
      before_events_groups
    end

    #def order_position_init
    #  position = 0
    #  @groups = Group.where(event_id: params[:event_id]).rank(:order)
    #  @groups.each do |group|
    #    group.order += 1
    #    group.save
    #  end
    #  test = @groups
    #  test
    #end
end
