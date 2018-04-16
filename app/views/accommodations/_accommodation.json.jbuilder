json.extract! accommodation, :id, :title, :accom_type, :address, :rating, :description, :created_at, :updated_at
json.url accommodation_url(accommodation, format: :json)
