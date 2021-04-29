class Api::V1::ReservationCreateSerializer < ActiveModel::Serializer
  attributes :id, :reservation_number, :date_at, :date_on, :number_people, :menu
  # userを関連付ける
  belongs_to :user, serializer: Api::V1::UserSerializer
end
