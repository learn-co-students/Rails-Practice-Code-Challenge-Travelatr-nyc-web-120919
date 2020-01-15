class GreetingsController < ApplicationController

    def greeting 
    end 

    def analytics
        @posts = Post.all 
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 

end
