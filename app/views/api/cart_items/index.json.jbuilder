@cart_items.each do |cart_item|
    json.set! cart_item.id do
        json.extract! cart_item, :id, :user_id, :product_id, :quantity
        json.extract! cart_item.product, :id, :name, :brand, :price, :description, :created_at, :updated_at
        json.pictureUrl cart_item.product.picture.attached? ? cart_item.product.picture.url : nil
    end
end