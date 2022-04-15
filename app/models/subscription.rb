class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  belongs_to :tea
  belongs_to :customer

  enum :status, { inactive: 0, active: 1}
end
