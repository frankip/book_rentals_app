class AuthorSerializer < ActiveModel::Serializer
  attributes :firstname , :lastname, :email, :phone
end
