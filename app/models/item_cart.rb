class ItemCart < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :quantity, numericality: true
  def as_json(options={})
    super(options).merge({
      item: Item.find(self.item_id),
    })
  end
end
