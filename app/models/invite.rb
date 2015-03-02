class Invite < ActiveRecord::Base
  belongs_to :itinerary
  validates :email, :itinerary_id, presence: true
end
