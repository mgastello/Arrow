json.review do
    json.extract! @review, :id, :author_id, :product_id, :display_name, :title, :body, :rating, :created_at, :updated_at
end