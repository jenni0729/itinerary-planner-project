class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, :user_id, presence: true

  has_many :activities, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :itineraries_users
  has_many :users, through: :itineraries_users
  has_many :reviews, as: :reviewable

end
