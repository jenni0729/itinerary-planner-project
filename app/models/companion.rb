class Companion < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_many :companions_activites
  has_many :activities, through: :companions_activities
  has_many :companions_itineraries
  has_many :itineraries, through: :companions_itineraries

  has_many :reviews, as: :reviewable
end
