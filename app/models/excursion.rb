class Excursion < ActiveRecord::Base
  belongs_to :city
  
  validates :ename, presence: true
  validates :city, presence: true
  validates :eprice, presence: true, numericality: {only_integer: true}
end
