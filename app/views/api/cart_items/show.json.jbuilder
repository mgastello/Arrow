json.cart_item do
    json.extract! @cart_item, :id, :user_id, :product_id, :quantity, :created_at, :updated_at
    json.extract! @cart_item.product, :name, :brand, :price, :description
    json.pictureUrl @cart_item.product.picture.attached? ? @cart_item.product.picture.url : nil
end