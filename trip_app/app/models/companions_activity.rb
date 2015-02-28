class CompanionsActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :companion
end
