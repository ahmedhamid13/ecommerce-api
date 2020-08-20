class ItemOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, numericality: true
  
  def as_json(options={})
    super(options).merge({
      item: self.item,
    })
  end
end
