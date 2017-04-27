class Tour < ActiveRecord::Base
  belongs_to :route

  validates :route, presence: true
  validates :tdate, presence: true
  validates :days, presence: true, numericality: {only_integer: true}
  validates :payment, numericality: {only_integer: true}
end
