class Tour < ActiveRecord::Base
  belongs_to :route, inverse_of: :tours

  validates :route, presence: true
  validates :tdate, presence: true
  validates :days, presence: true, numericality: {only_integer: true}
  validates :payment, numericality: {only_integer: true}

  accepts_nested_attributes_for :route, reject_if: :all_blank

  def trprice
    self.payment + self.route.rprice
  end
end
