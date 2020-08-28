class Cart < ApplicationRecord
  belongs_to :user
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  def as_json(options={})
    super(options).merge({
        items: self.items,
        user: { id: self.user.id, name: self.user.name, email: self.user.email},
        cart_endpoint: "#{Rails.configuration.api_url}/carts/#{self.id}"
    })
  end
end
