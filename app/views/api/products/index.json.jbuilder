@products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :brand, :price, :description, :created_at, :updated_at
        json.pictureUrl product.picture.attached? ? product.picture.url : nil
        json.imageUrls product.images.map { |file| file.url }
    end 
end