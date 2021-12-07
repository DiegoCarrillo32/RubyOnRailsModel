class Order < ApplicationRecord
  belongs_to :user
  validates :date, :active, :total, presence: true
  validate :valid_order, :valid_date
  has_many :order_items
  has_many :products, through: :order_items
  before_save :set_default, :total_price

  def check_orders
    if Order.where(active: true).where(user_id: user.id).count > 0
      true
    else
      false
    end
  end

  def toggle_active
    if update(active: !active)
      true
    else
      false
    end
  end

  private

  def valid_order
    if check_orders
      errors.add(:user, 'You can only have one active order')
      false
    end
  end

  def valid_date
    if date > Time.now
      errors.add(:date, 'Date must be in the past')
      false
    end
  end

  def total_price
    if order_items.count > 0
      self.total = order_items.sum { |obj| obj.total }
    else
      0
    end
  end

  def set_default
    self.orderNumber = (SecureRandom.random_number * (10**5)).round
  end
end
