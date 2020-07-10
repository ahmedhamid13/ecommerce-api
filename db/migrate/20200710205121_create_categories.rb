class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, default: 'category_title'

      t.timestamps
    end
  end
end
