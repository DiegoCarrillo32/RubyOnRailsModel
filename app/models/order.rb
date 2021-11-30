class Order < ApplicationRecord
  before_save :set_default
  belongs_to :user
  has_many :order_items
  # total, orderNumber no estan en validates porque se generan automaticamente
  validates :date, :active, presence: true
  validate :valid_order


  def checkOrders
    # si las ordenes del usuario estan activas , no se puede crear una nueva
    # devuelve true si hay ordenes activas
    if Order.where(active: true).where(user_id: user.id).count > 0
      true

    else
      false
    end

  end




  def toggleActive

    if update_attribute(:active, !active)

      true

    else

      false

    end

  end

  def totalPrice


    if order_items.count > 0
      order_items.sum { |obj| obj.total }
    else
      0
    end

  end
  private

  def valid_order
    if checkOrders
      errors.add(:user, 'You can only have one active order')
    end
  end
  
  protected
  
  def set_default

    self.orderNumber = (SecureRandom.random_number * (10**5)).round
    self.total = totalPrice

  end
end
