class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    has_many :items, through: :sub_categories

    validates :title, presence: true, length: { minimum: 3 }

    def as_json(options={})
        super(options).merge({
            category_endpoint: "#{Rails.configuration.api_url}/categories/#{self.id}"
        })  
    end
end
