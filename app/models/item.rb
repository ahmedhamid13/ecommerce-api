class Item < ApplicationRecord
    has_many :item_carts
    has_many :carts, through: :item_carts

    validates :title, presence: true, length: { minimum: 3 }
    validates :price, :quantity, numericality: true
    validates :price, :stock, presence: true
end
