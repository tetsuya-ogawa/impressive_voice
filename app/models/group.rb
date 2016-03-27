class Group < ActiveRecord::Base

  include RankedModel
  ranks :order

  belongs_to :event

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players, allow_destroy: true

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  #validates :name
end
