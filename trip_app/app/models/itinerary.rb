class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, presence: true

  has_many :destinations, dependent: :destroy

  has_many :companions_itineraries
  has_many :companions, through: :companions_itineraries
  has_many :reviews, as: :reviewable
  belongs_to :user

end
