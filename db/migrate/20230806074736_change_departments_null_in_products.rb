class ChangeDepartmentsNullInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :department, true
  end
end
