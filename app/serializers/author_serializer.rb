class AuthorSerializer < ActiveModel::Serializer
  attributes :firstname , :lastname, :email, :phone
  has_many :books
end
