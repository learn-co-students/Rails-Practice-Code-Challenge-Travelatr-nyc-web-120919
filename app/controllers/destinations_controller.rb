class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end
    
    
    def show
        @destination = Destination.find(params[:id])
        @posts = Post.all
        @bloggers = Blogger.all
    end

    def create
        @destination = Destination.new(destinations_params(:name, :country))
        if @destination.save
        redirect_to destination_path(@destination)
        else 
            flash[:errors] = @destination.errors.full_messages
            redirect_to new_destination_path
        end
    end

    def edit
        @destination = Destination.find(params[:id])
        if @destination.update
            redirect_to destination_path(@destination)
        else 
            flash[:errors] = @destination.errors.full_messages
            redirect_to new_destination_path
        end
    end

    def update
        @destination = Destination.find(params[:id])
        @destination.update(bloggers_params(:name, :country))
        redirect_to destination_path(@destination)
    end

    private

    def destinations_params(*args)
        params.require(:destination).permit(*args)
    end
end