class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end
    
    
    def show
        @blogger = Blogger.find(params[:id])
        @posts = Post.all
    end

   

    def create
        @blogger = Blogger.new(bloggers_params(:name, :bio, :age))
        if @blogger.save
        redirect_to blogger_path(@blogger)
        else 
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(bloggers_params(:name, :bio, :age))
        redirect_to blogger_path(@blogger)
    end

    private

    def bloggers_params(*args)
        params.require(:blogger).permit(*args)
    end
end