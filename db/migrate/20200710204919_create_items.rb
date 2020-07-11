class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.decimal :price, null: false, default: 0, precision: 10, scale: 2
      t.integer :stock, null: false, default: 0
      t.string :brand, default: 'brand'
      t.text :description, default: 'description'
      # t.text :images

      t.timestamps
    end
  end
end
