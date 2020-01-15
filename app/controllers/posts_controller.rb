class PostsController < ApplicationController

    def index
        @posts = Post.all
    end 

    def show
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new 
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        if @post.save 
            @post.save 
            redirect_to post_path(@post)
        else 
            byebug
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end 
    end 

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            @post.update(post_params)
            redirect_to post_path(@post)
        else 
            byebug
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end 
    end 

    def like 
        @post = Post.find(params[:id])
        @post.like_post
        redirect_to post_path(@post)
    end     

    private

    def post_params
        params.require(:post).permit(:title, :blogger_id, :destination_id, :content)
    end 


end
