json.extract! catalog, :id, :name, :description, :points, :categories_id, :created_at, :updated_at
json.url catalog_url(catalog, format: :json)