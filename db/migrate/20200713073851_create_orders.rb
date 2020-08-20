class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state, default: 'processing'
      t.string :country
      t.string :city
      t.string :address, unique: true
      t.string :telephone, unique: true

      t.timestamps
    end
  end
end
