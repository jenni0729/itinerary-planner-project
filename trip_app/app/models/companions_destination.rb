class CompanionsDestination < ActiveRecord::Base
  belongs_to :destination
  belongs_to :companion
end
