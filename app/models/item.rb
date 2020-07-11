class Item < ApplicationRecord
    has_many :item_carts
    has_many :carts, through: :item_carts
    has_many_attached :images

    validates :title, presence: true, length: { minimum: 3 }
    validates :price, :stock, numericality: true
    validates :price, :stock, presence: true

    def get_images
        arr = []
        self.images.each do |image|
            arr << "#{Rails.configuration.api_url}#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}"
        end
        arr
    end

    def as_json(options={})
        super(options).merge({
            imagas: self.get_images
        })
    end
end
