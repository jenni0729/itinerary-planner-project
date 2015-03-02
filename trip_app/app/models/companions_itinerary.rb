class CompanionsItinerary < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :companion
end
