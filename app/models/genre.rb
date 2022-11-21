class Genre < ApplicationRecord
  has_many :home_appliances
  belongs_to :review
end
