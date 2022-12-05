class Genre < ApplicationRecord
  has_many :reviews
  has_many :home_appliances
end
