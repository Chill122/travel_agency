json.extract! reservation, :id, :persons, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
