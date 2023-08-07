class EditDepartments < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :department, :string, :default => 'misc', :null => false
  end
end
