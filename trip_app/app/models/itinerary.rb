class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, presence: true

  has_many :destinations, dependent: :destroy
  has_many :companions, dependent: :destroy

end
