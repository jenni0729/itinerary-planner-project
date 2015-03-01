class Activity < ActiveRecord::Base
  validates :location, :name, :date, presence: true
  belongs_to :itinerary
  has_many :activities_users
  has_many :users, through: :activities_users

  has_many :reviews, as: :reviewable
end
