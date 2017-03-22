json.extract! room, :id, :status, :name, :created_at, :updated_at
json.url room_url(room, format: :json)
