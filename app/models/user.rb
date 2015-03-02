class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  has_many :itineraries_users
  has_many :itineraries, through: :itineraries_users 
  has_many :activities_users
  has_many :activities, through: :activities_users 

end
