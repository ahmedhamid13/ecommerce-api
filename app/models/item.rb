class Item < ApplicationRecord
    belongs_to :sub_category
    has_one :category, through: :sub_category
    has_many_attached :images

    has_many :item_carts
    has_many :carts, through: :item_carts
    has_many :item_orders
    has_many :orders, through: :item_orders

    validates :title, presence: true, length: { minimum: 3 }
    validates :price, :stock, presence: true, numericality: { greater_than: 0 }

    def get_images
        arr = []
        self.images.each do |image|
            arr << "#{Rails.configuration.api_url}#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}"
        end
        arr
    end

    def as_json(options={})
        super(options).merge({
            images: self.get_images,
            # main_category: self.category,
            sub_category: self.sub_category,
            item_endpoint: "#{Rails.configuration.api_url}/items/#{self.id}"
        })
    end

end
