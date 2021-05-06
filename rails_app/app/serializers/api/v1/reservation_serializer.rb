class Api::V1::ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date_at, :date_on, :number_people, :menu, :budget, :inquiry, :reservation_number

  belongs_to :store, serializer: Api::V1::StoreSerializer
  belongs_to :user, serializer: Api::V1::UserSerializer
end
