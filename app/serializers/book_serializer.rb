class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :author
  has_many :users
end
