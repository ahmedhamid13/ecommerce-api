class ItemCart < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :quantity, numericality: true
end
