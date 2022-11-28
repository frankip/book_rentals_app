class Author < ApplicationRecord
    has_many :books

    
    validates :firstname, presence: true
    validates :lastname, presence: true

end
