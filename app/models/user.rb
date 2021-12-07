class User < ApplicationRecord
  validates :name, :lastName, :password, :email, :birthDate, :active, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :valid_date
  has_many :orders, dependent: :destroy
  before_save :encrypt_password
  scope :active_users, -> { where(active: true) }

  def toggle_active
    if update_attribute(:active, !active)
      true
    else
      false
    end
  end

  def current_age
    Time.now.year - birthDate.year
  end

  def valid_date
    if birthDate > Time.now
      errors.add(:birthDate, "Birth date cant be in the future")
    end
  end

  private

  def encrypt_password
    self.password = password.encrypt(:symmetric, password: 'secret_key')
  end

end
