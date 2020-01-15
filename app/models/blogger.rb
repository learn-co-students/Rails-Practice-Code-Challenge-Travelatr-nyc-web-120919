class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: {case_sensitive: false}, presence: true  
    validates :bio, length: {minimum: 30}
    validate :age_above_zero


    def age_above_zero
        if self.age < 1 
            errors.add(:age, "Your age cannot be 0")
        end
    end
end
