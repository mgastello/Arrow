class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
