json.cart_item do
    json.extract! @cart_item, :id, :user_id, :product_id, :quantity, :created_at, :updated_at
end