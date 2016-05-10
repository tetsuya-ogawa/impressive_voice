class Event < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :songs, through: :groups
  #has_many :performance_groups, :class_name => 'Events::PerformanceGroup'

  validates :name, presence: true

  def number_groups
    groups.count
  end

end
