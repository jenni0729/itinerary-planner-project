class Destination < ActiveRecord::Base
  validates :location, :name, :date, presence: true

  belongs_to :itinerary
end
