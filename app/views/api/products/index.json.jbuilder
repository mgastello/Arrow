json.products @products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :price, :description, :image, :created_at, :updated_at
    end
end