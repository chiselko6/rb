json.extract! room, :id, :num, :rooms_count, :price, :created_at, :updated_at
json.url room_url(room, format: :json)
