class Currency < ApplicationRecord
  validates :date, :currency_type, presence: true
  enum currency_type: %i(bitcoin etherium nasdaq)
end
