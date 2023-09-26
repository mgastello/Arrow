# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord
    validates :user_id, :product_id, presence: true
    validates :user_id, uniqueness: { scope: :product_id }

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :product,
        primary_key: :id,
        foreign_key: :product_id,
        class_name: :Product
end
