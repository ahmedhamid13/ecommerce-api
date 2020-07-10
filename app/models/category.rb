class Category < ApplicationRecord
    has_many :sub_categories

    validates :title, presence: true, length: { minimum: 3 }
end
