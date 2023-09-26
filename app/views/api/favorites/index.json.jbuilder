@favorites.each do |favorite|
    json.set! favorite.id do
        json.extract! favorite, :id, :user_id, :product_id
        json.extract! favorite.product, :name, :brand, :price, :description, :created_at, :updated_at
        json.pictureUrl favorite.product.picture.attached? ? favorite.product.picture.url : nil
    end
end