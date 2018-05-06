json.extract! reservation, :id, :user_id, :date_in, :date_out, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
