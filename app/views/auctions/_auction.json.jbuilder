json.extract! auction, :id, :title, :description, :end, :reserve, :user_id, :created_at, :updated_at
json.url auction_url(auction, format: :json)
