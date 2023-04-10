# json.set!(@product.id) do
json.product do
    json.extract! @product, :id, :name, :brand, :price, :description, :created_at, :updated_at
    json.pictureUrl @product.picture.attached? ? @product.picture.url : nil
end