json.extract! offer, :id, :title, :price, :spots, :start_date, :end_date, :description, :created_at, :updated_at
json.url offer_url(offer, format: :json)
