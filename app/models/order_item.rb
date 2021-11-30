class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates  :quantity, presence: true
  before_save :set_default
  validate :valid_product, :valid_active, :valid_quantity

  private

  def valid_product
    # Check if the product is already in the order
    if self.order.order_items.where(product_id: self.product_id).count > 0
      errors.add(:order, "Cant have repeated products in the same order")
    end

    def valid_active
      if self.product.active == false
        errors.add(:product, "Product is not active")
      end
    end
  end
  def valid_quantity
    if self.quantity > self.product.quantity
      errors.add(:quantity, "Quantity is greater than the available quantity")
    elsif self.quantity <= 0
      errors.add(:quantity, "Quantity must be greater than 0")
    end
  end
  def set_default
    self.total = product.price * quantity
    order.update_attribute(:total, order.total + total)
  end
end
