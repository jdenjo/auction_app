class AuctionCollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :end, :reserve, :user_id, :created_at, :updated_at
end
