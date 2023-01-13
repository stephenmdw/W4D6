class ArtworksController < ApplicationController
    def index
        # debugger
        user = User.find(params[:user_id])
        # artwork = Artwork.find(params[:id])
        #how do we find the user's artwork
            #linking userID to artistID, and then returning artwork
        render json: user.artworks
    end

    def create 
        # debugger
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else  
            render json: artwork.errors.full_messages, status: 422
        end
       
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artworks_url(@artwork)
        else  
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end
    
    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end