class Api::V1::LikesController < ApplicationController
  def create
    wish = Wish.find(params[:like][:wish_id])
    already_like = Like.find_by(ip: request.remote_ip, wish_id: wish.id)

    if already_like
      render json: already_like, status: :bad_request
    else
      like = Like.new(likes_params)
      like.ip = request.remote_ip

      if like.save
        render json: like
      else
        render json: like.errors, status: :bad_request
      end
    end
  end

  private

  def likes_params
    params.require(:like).permit(:wish_id)
  end
end
