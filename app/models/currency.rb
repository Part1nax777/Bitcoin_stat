class Currency < ApplicationRecord
  validates :date, :currency_type, presence: true

  enum currency_type: [:bitcoin, :ethereum, :nasdaq]
end
