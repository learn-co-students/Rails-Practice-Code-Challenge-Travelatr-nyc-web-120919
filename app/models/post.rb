class Post < ApplicationRecord
belongs_to :blogger
belongs_to :destination


    validate :post_char_requirement

    #sets character requirement for posts to 100
    def post_char_requirement
        if self.content.size < 100
            errors.add(:content, "must be longer than 100 characters - previous edit attempt had #{self.content.size} characters")
        end 
    end 

    def like_post
        self.likes += 1 
        self.save 
    end     

end
 