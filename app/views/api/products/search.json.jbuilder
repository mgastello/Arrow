json.search do
	@products.each do |product|
		json.set! product.id do
			json.extract! product, :id, :name, :description, :price, :brand, :department
			json.pictureUrl product.picture.attached? ? product.picture.url : nil
		end
	end
end