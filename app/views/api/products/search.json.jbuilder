json.search do
	@products.each do |product|
		json.set! product.id do
			json.extract! product, :id, :name, :description, :price, :brand
			json.pictureUrl
		end
	end
end