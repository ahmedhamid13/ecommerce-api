class SubCategory < ApplicationRecord
  belongs_to :category
  has_one :item, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }

  def as_json(options={})
    super(options).merge({
        main_category: self.category,
        sub_category_endpoint: "#{Rails.configuration.api_url}/sub_categories/#{self.id}"
    })  
  end
end
