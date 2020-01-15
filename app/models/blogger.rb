class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

validates :name, uniqueness: { case_sensitive: false } 
validate :bio_char_requirement

    def bio_char_requirement
        if self.bio.size < 30
            errors.add(:bio, "must be more than 30 characters long - previous attempt had #{self.bio.size}")           
        end 
    end 


    #selects the post for an individual blogger with the most likes
    #selects first post alphabetically if there are no likes
    #experimented with other options but this seems the best for now
    #causes a problem if the author has no posts so far. 
    #implemented logic in the show erb to avoid further problems
    def most_likes
        self.posts.max_by do |post|
            post.likes 
        end             
    end

    #should calculate the total number of likes for an individual blogger
    def total_likes
        running_total = 0
        self.posts.each do |post|
            running_total += post.likes
        end 
        running_total 
    end
 
    #Creates a hash for the blogger with keys as the destination name, and values as the number of posts that the blogger has about this destination
    def destinations_by_number_of_posts
        my_hash = {}
        my_array = self.destinations.pluck(:name)
        my_array.each do |destination_name|
            if my_hash[destination_name]
                my_hash[destination_name] += 1
            else 
                my_hash[destination_name] = 1
            end 
        end  
        my_hash
    end 
    
    #creates AoA where each inner array has the destination name, and the number of posts about it - ordered by number of posts about it
    def top_destinations_in_order
        my_hash = self.destinations_by_number_of_posts.sort_by do |destination, post_number|
                post_number
        end 
        my_hash.reverse
    end 

    #limits the AoA from top_destination_in_order to first 5. creates a new array with the top destinations in order
    def top_five_destinations
        my_array = []
        self.top_destinations_in_order[0..4].each do |destination|
            my_array << destination[0]
        end 
        my_array 
    end 

    #average age for analytics page
    def self.average_age
        Blogger.all.pluck(:age).reduce {|n, sum| sum + n} / Blogger.all.count
    end 

    #average number of posts per blogger for anyaltics
    def self.average_num_of_posts
        running_total = 0
        Blogger.all.each do |blogger|
            running_total += blogger.posts.count
        end 
        (running_total / Blogger.all.count).to_f
    end 

    #get most prolific blogger for analytics
    def self.most_prolific
        Blogger.all.max_by do |blogger|
            blogger.posts.count
        end 
    end 

end
