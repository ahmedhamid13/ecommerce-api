class Cart < ApplicationRecord
  belongs_to :user
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  def as_json(options={})
    super(options).merge({
        items: self.item_carts,
    })
  end
end
