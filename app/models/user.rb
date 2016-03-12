class User < ActiveRecord::Base
  validates :name, presence: true #name master
  has_secure_password
  validates :password, presence: true, length: {minimum: 6} #pass master
end