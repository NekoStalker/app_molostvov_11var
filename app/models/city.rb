class City < ActiveRecord::Base
  has_many :excursions, dependent: :destroy, inverse_of: :city
  has_many :routes, dependent: :destroy, inverse_of: :city

  validates :cname, presence: true
end
