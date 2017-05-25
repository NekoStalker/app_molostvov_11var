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

  def self.search(params)
    t = params['tour']
    r = params['route']
    c = params['city']
    result = Tour.eager_load(:route, route: :city)
    if c[:cname].present?
      result = result.where('cities.id = ?', c[:cname])
    end
    if r[:rname].present?
      result = result.where('routes.id = ?', r[:rname])
    end
    if t[:tdatef].present? && t[:tdatet].present?
      result = result.where('tdate BETWEEN ? AND ?', t[:tdatef], t[:tdatet])
    end
    if t[:tdatef].present? && !t[:tdatet].present?
      result = result.where('tdate >= ?', t[:tdatef])
    end
    if !t[:tdatef].present? && t[:tdatet].present?
      result = result.where('tdate <= ?', t[:tdatet])
    end
    if t[:daysf].present? && t[:dayst].present?
      result = result.where('days BETWEEN ? AND ?', t[:daysf], t[:dayst])
    end
    if t[:daysf].present? && !t[:dayst].present?
      result = result.where('days >= ?', t[:daysf])
    end
    if !t[:daysf].present? && t[:dayst].present?
      result = result.where('days <= ?', t[:dayst])
    end
    if r[:rpricef].present? && r[:rpricet].present?
      result = result.where('routes.rprice BETWEEN ? AND ?', r[:rpricef], r[:rpricet])
    end
    if r[:rpricef].present? && !r[:rpricet].present?
      result = result.where('routes.rprice >= ?', r[:rpricef])
    end
    if !r[:rpricef].present? && r[:rpricet].present?
      result = result.where('routes.rprice <= ?', r[:rpricet])
    end
    if t[:paymentf].present? && t[:paymentt].present?
      result = result.where('payment BETWEEN ? AND ?', t[:paymentf], t[:paymentt])
    end
    if t[:paymentf].present? && !t[:paymentt].present?
      result = result.where('payment >= ?', t[:paymentf])
    end
    if !t[:paymentf].present? && t[:paymentt].present?
      result = result.where('payment <= ?', t[:paymentt])
    end
    if t[:tdesc].present?
      result = result.where('tdesc ilike ?', ?% + t[:tdesc] + ?%)
    end
    if r[:rdesc].present?
      result = result.where('routes.rdesc ilike ?', ?% + r[:rdesc] + ?%)
    end
    result.all
  end
end
