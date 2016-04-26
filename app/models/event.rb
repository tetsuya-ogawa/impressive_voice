class Event < ActiveRecord::Base
  has_many :groups
  has_many :songs, through: :groups
  #has_many :performance_groups, :class_name => 'Events::PerformanceGroup'

  def number_groups
    groups.count
  end

end
