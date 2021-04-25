class Api::V1::ReservationIndexSerializer < ActiveModel::Serializer
  attributes :id, :date_at, :date_on
  belongs_to :store, serializer: Api::V1::StoreSerializer
  belongs_to :user, serializer: Api::V1::UserSerializer
end
