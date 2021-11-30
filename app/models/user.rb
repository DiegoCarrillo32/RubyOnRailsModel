class User < ApplicationRecord

  before_save :set_default
  has_many :orders, dependent: :destroy
  validates :name, :lastName, :password, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :valid_date


  scope :getActive, -> { where(active: true) }

  def toggleActive

    if update_attribute(:active, !active)

      true

    else

      false

    end

  end

  def getAge

    # toma el año actual y le resta el año de nacimiento para obtener la edad

    Time.now.year - birthDate.year

  end

  #Custom validations
  def valid_date
    if birthDate >= Time.now
      errors.add(:birthDate, "La fecha de nacimiento no puede ser mayor a la fecha actual")
    end
  end

  protected

  def set_default
    self.active = true if active.nil?
    self.password = password.encrypt(:symmetric, password: 'secret_key')

    # u.password.decrypt(:symmetric, :password => "secret_key")

  end

  # :active should be true by default

  # validates :active, inclusion: { in: [true, false] }

end
