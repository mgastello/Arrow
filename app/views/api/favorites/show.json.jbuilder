json.favorite do
    json.extract! @favorite, :id, :user_id, :product_id, :created_at, :updated_at
    json.extract! @favorite.product, :name, :brand, :price, :description
    json.pictureUrl @favorite.product.picture.attached? ? @favorite.product.picture.url : nil
end