class Player < ActiveRecord::Base
  belongs_to :group
  belongs_to :member
end
