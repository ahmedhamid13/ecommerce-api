class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders, dependent: :destroy
  has_many :items, through: :item_orders

  def as_json(options={})
    super(options).merge({
        items: self.item_orders,
    })
  end
end
