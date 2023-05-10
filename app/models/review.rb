# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  product_id :bigint           not null
#  title      :string           not null
#  body       :text             not null
#  rating     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord
    validates :product_id, :title, :body, :rating, presence: true
    validates :author_id, presence: true, message: "Please enter a display name that does not contain special characters (must be less than 25 characters)"
    validates :title, length: { maximum: 200, message: "Please enter a review title (must be less than 200 characters)" }
    validates :body, length: { minimum: 20, message: "Reviews must be at least 20 characters" }
    validates :rating, inclusion: { in: 1..5 }

    belongs_to :user,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :product,
        primary_key: :id,
        foreign_key: :product_id,
        class_name: :Product
end