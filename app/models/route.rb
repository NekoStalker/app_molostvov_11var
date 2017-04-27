class Route < ActiveRecord::Base
  belongs_to :city
  has_many :tours
  
  validates :rname, presence: true
  validates :city, presence: true
  validates :rprice, presence: true, numericality: {only_integer: true}
end
