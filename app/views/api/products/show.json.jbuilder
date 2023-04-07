json.product do
    json.extract! @product, :id, :name, :brand, :price, :description, :created_at, :updated_at
    json.image 'https://placehold.co/250x200'
end