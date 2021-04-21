class Api::V1::ReservationSerializer < ActiveModel::Serializer
  attributes :date_at, :date_on, :number_people, :menu
end
