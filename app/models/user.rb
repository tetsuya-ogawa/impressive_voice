class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :member

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
