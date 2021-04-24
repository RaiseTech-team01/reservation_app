class Api::V1::ReservationCreateSerializer < ActiveModel::Serializer
  attributes :reservation_number, :date_at, :date_on, :number_people, :menu
end
