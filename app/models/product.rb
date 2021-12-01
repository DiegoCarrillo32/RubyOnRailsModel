class Product < ApplicationRecord
  before_save :set_default
  has_many :order_items
  validates :name, :code, :price, :quantity, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }


  def toggleActive

    if update_attribute(:active, !active)

      true

    else

      false

    end

  end

  protected

  def set_default
    self.code = SecureRandom.uuid
  end
end
