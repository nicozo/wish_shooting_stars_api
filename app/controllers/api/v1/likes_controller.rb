class Api::V1::LikesController < ApplicationController
  def create
    like = Like.new(likes_params)

    if like.save
      render json: like
    else
      render json: like.errors, status: :bad_request
    end
  end

  private

  def likes_params
    params.require(:like).permit(:wish_id)
  end
end
