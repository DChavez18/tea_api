class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true, inclusion: { in: ['active', 'canceled'] }
  validates :frequency, presence: true
  validates :tea_id, presence: true
  validates :customer_id, presence: true

  enum status: [:active, :canceled]
  enum frequency: [:weekly, :monthly]
end