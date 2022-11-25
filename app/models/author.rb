class Author < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname, presence: true

end
