class Book < ApplicationRecord
    belongs_to :author
    has_many :rentals
    has_many :users, through: :rentals

    validates :title, presence: true
end