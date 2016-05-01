class Member < ActiveRecord::Base
  has_many :players
  belongs_to :user

  validates :name, presence: true
  validates :year, numericality: true

end
