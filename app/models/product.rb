# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  price       :float            not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
    validates :name, :price, :description, presence: true
    validates :name, uniqueness: true
    validates :price, format: { with: /\A\d+(?:\.\d{2})?\z/, message: "format must be a number with 2 decimals" }

    # has_many reviews,
    #     primary_key: :id,
    #     foreign_key: :product_id,
    #     class_name: Review
end
