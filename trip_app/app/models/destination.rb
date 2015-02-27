class Destination < ActiveRecord::Base
  validates :location, :name, :date, presence: true
  belongs_to :itinerary
  has_many :companions_destinations
  has_many :companions, through: :companions_destinations

  has_many :reviews, as: :reviewable
end
