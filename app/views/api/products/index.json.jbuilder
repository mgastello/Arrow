json.products @products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :price, :description, :created_at, :updated_at
        json.image 'https://placehold.co/250x200'
    end 
end