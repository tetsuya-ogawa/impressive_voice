class Events::ProgramsController < ApplicationController
  def edit
    @groups = Group.where(event_id: params[:event_id]).rank(:order)
  end

  def sort
    band_info=params[:group][:name].split
    band_name=band_info[0]
    group = Group.find_by(name: band_name)
    group.order_position = params[:group][:order_position].to_i + count_before_events_groups(group)
    group.save
    render nothing: true
  end

  private

    def count_before_events_groups(group)
      before_events_groups = 0
      #events = Event.where('id < ?', group.event_id)
      events = Event.where(Event.arel_table[:id].lt(group.event_id))
      events.each do |event|
        before_events_groups += event.groups.count
      end
      before_events_groups
    end

end
