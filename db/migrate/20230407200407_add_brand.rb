class AddBrand < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :brand, :string, null: false
  end
end
