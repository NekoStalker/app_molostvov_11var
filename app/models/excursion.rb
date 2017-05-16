class Excursion < ActiveRecord::Base
  belongs_to :city, inverse_of: :excursions
  
  validates :ename, presence: true
  validates :city, presence: true
  validates :eprice, presence: true, numericality: {only_integer: true}

  accepts_nested_attributes_for :city, reject_if: :all_blank
end
