class Activity < ActiveRecord::Base
  validates :location, :name, :date, presence: true
  belongs_to :itinerary
  has_many :activities_users
  has_many :users, through: :activities_users
  has_many :reviews, as: :reviewable

  validates :date,
          date: { after_or_equal_to: :start_date, message: 'stop being a dick - activity date must be during the trip' }
  
  validates :date,
          date: { before_or_equal_to: :end_date, message: 'stop being a dick - activity date must be during the trip'}
end