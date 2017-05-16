class Route < ActiveRecord::Base
  belongs_to :city, inverse_of: :routes
  has_many :tours, dependent: :destroy, inverse_of: :route
  
  validates :rname, presence: true
  validates :city, presence: true
  validates :rprice, presence: true, numericality: {only_integer: true}

  accepts_nested_attributes_for :city, reject_if: :all_blank
end
