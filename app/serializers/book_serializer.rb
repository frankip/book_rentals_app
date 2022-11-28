class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :author
end
