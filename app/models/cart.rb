class Cart < ApplicationRecord
  belongs_to :user
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  def as_json(options={})
    super(options).merge({
        item_carts: self.item_carts,
    })
  end
end
