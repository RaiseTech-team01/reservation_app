class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :furigana, :email, :tel, :gender, :address, :image
end
