class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates  :quantity, :total, presence: true
  validate :valid_product, :valid_active, :valid_quantity
  before_save :set_total, :set_order_total

  private

  def valid_product
    if self.order.order_items.where(product_id: self.product_id).count > 0
      errors.add(:order, "Cant have repeated products in the same order")
    end
  end

  def valid_active
    if self.product.active == false
      errors.add(:product, "Product is not active")
    end
  end

  def valid_quantity
    if self.quantity > self.product.quantity
      errors.add(:quantity, "Quantity is greater than the available quantity")
    elsif self.quantity <= 0
      errors.add(:quantity, "Quantity must be greater than 0")
    end
  end

  def set_total
    self.total = self.quantity * self.product.price
  end

  def set_order_total
    order.update(total: (order.total + total))
  end
end
