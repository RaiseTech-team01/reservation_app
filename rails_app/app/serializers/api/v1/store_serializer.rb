class Api::V1::StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :furigana, :email, :tel, :fax, :postal_code, :address, :url, :seat
end
