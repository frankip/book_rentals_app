class User < ApplicationRecord
    has_many :rentals
    has_many :books, through: :rentals

    validates :first_name, presence: true
    validates :last_name, presence: true
end
