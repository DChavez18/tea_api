class Subscription < AppliationRecord
  belongs_to :customer
  belongs_to :tea
end