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
#  brand       :string           not null
#
class Product < ApplicationRecord
    validates :name, :brand, :price, :description, :department, presence: true
    # validates :department, default: 'misc'
    validates :name, uniqueness: true
    validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "format must be a number with 2 decimals" }

    has_one_attached :picture
    has_many_attached :images

    has_many :cart_items,
        primary_key: :id,
        foreign_key: :product_id,
        class_name: :CartItem

    has_many :reviews,
        primary_key: :id,
        foreign_key: :product_id,
        class_name: :Review
end
