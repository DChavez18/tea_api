class Tea < AppliationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions
end