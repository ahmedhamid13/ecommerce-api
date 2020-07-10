class CreateSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_categories do |t|
      t.references :item, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title, null: false, default: 'sub_category_title'

      t.timestamps
    end
  end
end
