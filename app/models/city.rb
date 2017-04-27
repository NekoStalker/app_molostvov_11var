class City < ActiveRecord::Base
  has_many :excursions
  has_many :routes

  validates :cname, presence: true
end
