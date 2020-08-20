class SubCategory < ApplicationRecord
  belongs_to :item
  belongs_to :category

  validates :title, presence: true, length: { minimum: 3 }
end