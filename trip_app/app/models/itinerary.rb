class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, :user, presence: true

  has_many :activities, dependent: :destroy
  has_many :companions_itineraries
  has_many :companions, through: :companions_itineraries
  has_many :reviews, as: :reviewable
  belongs_to :user

end
