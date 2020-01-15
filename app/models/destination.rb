class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts


    #returns either the title of the most-liked post, the message if no posts have been liked yet
    def most_likes
        self.posts.max_by do |post|
            post.likes 
        end
     
    end 

    def average_blogger_age
        bloggers = self.bloggers.uniq
        if bloggers.length > 0
            running_total = 0
            bloggers.each do |blogger|
                running_total += blogger.age 
            end 
            running_total / bloggers.count
        else 
            "No bloggers have reviewed this destination yet"
        end     
    end 

    #creates an array of posts for a destination that is sorted by the post's created date in order from most-recent to oldest
    #self.posts is already sorted by created_at
    #need to reverse self.posts so that the array runs from most-recent to oldest, then select the first 5 of the new array 
    def recent_five
        my_array = self.posts.reverse 
        recent_five_array = my_array[0..4]
    end 


end
