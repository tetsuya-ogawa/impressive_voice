class Group < ActiveRecord::Base
  belongs_to :event

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true
end