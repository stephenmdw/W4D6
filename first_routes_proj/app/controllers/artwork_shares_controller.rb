class ArtworkSharesController < ApplicationController

    def create 
        # debugger
        artworkshare = Artwork.new(artworkshare_params)
        if share.save
            render json: artworkshare
        else  
            render json: artworkshare.errors.full_messages, status: 422
        end
    end

    def destroy
        @artworkshare = ArtworkShare.find(params[:id])
        @artworkshare.destroy
        render json: @artworkshare
    end
    
    private
    def artworkshare_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end