module EventsHelper
  def total_time(event)
    total_time = 0
    groups = event.groups
    groups.each do |group|
      total_time = total_time + group.songs.sum("time")
    end
    total_time
  end

  def day_japanese(day_hash)
    day_hash
    day_japanese = "#{day_hash[1]}" + "年" + "#{day_hash[2]}" + "月" + "#{day_hash[3]}" + "日"
  end
end
