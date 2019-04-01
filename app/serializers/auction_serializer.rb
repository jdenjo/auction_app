class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :end, :reserve, :user_id, :created_at, :updated_at
  belongs_to :user
  has_many :bids
end
