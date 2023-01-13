class LikesController < ApplicationController
    def index
        if params[:artwork_id]
            render json: Like.where(artwork_id: params[:artwork_id])
        elsif  params[:comment_id]
            render json: Like.where(comment_id: params[:comment_id])
        end
    end

    def create
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: 422
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to likes_url
    end


    private

    def like_params
        params.require(:like).permit(:liker_id, :likeable_type, :likeable_id)
    end
end