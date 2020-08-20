class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    has_many :items, through: :sub_categories

    validates :title, presence: true, length: { minimum: 3 }
end
