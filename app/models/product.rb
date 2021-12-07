class Product < ApplicationRecord
  has_many :order_items
  validates :name, :code, :price, :quantity, :active, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }
  before_save :set_default

  def toggle_active
    if update(active: !active)
      true
    else
      false
    end
  end

  private

  def set_default
    self.code = SecureRandom.uuid
  end
end
