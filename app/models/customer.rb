class Customer < AppliationRecord
  has_many :subscriptions
  has_many :teas, through: :subscriptions
end