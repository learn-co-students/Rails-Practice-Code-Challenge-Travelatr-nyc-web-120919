class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end


    def show
        @post = Post.find(params[:id])
        @destinations = Destination.all
    end

    def create
        @post = Post.new(posts_params(:title, :content, :likes, :blogger_id, :destination_id))
        if @post.save
        redirect_to post_path(@post)
        else 
        flash[:errors] = @post.errors.full_messages
        redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(posts_params(:title, :content, :likes, :blogger_id, :destination_id))
        redirect_to post_path(@post)
    end

    private

    def posts_params(*args)
        params.require(:post).permit(*args)
    end
end