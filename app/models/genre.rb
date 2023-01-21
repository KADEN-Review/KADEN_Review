class Genre < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :home_appliances, dependent: :destroy
end
