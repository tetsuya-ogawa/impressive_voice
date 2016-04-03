class Events::ProgramsController < ApplicationController
  def edit
    program_init
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
        before_events_groups += event.number_groups
      end
      before_events_groups
    end

    def program_init
      position = 0
      group_all = Group.order(:event_id)
      events_groups = {}
      events_groups = group_all.group_by{|group| group.event_id}
      events_groups.each_value do |event_groups|
        groups = Group.where(id: event_groups.map{ |event_group| event_group.id })
        groups.rank(:order).each do |group|
          group.order_position = position
          group.save
          position += 1
        end
      end
    end

end
