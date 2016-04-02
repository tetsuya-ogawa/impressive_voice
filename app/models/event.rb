class Event < ActiveRecord::Base
  has_many :groups
  #has_many :performance_groups, :class_name => 'Events::PerformanceGroup'
end
