class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.decimal :price, null: false, precision: 8, scale: 2
      t.integer :inventory, null: false, default: 0

      t.timestamps
    end
  end
end
