class Activity < ActiveRecord::Base
  validates :location, :name, :date, presence: true
  belongs_to :itinerary
  has_many :companions_activities
  has_many :companions, through: :companions_activities

  has_many :reviews, as: :reviewable
end
