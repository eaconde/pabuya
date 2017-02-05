json.extract! admin_event, :id, :name, :description, :date_from, :date_to, :created_at, :updated_at
json.url admin_event_url(admin_event, format: :json)