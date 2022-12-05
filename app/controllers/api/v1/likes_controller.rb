class Api::V1::LikesController < ApplicationController
  def create
    wish = Wish.find(params[:like][:wish_id])

    if cookies[:like_wish_id].nil?
      cookies.permanent[:like_wish_id] = wish.id.to_s
    else
      cookies.permanent[:like_wish_id] = cookies.permanent[:like_wish_id] + ',' + wish.id.to_s
    end

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
