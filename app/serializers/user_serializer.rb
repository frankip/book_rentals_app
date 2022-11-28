class UserSerializer < ActiveModel::Serializer
  attributes :first_name , :last_name, :email, :phone

  has_many :books
end
