class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.integer :quantity
      t.decimal :price, :decimal, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
