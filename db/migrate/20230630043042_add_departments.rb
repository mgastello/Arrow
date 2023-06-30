class AddDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :department, :string, null: false
  end
end
