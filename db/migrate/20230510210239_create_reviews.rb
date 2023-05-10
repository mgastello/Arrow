class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :author, null: false, index: true, foreign_key: {to_table: :users}
      t.references :product, null: false, index: true, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
