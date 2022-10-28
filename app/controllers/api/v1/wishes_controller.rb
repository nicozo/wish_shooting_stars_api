class Api::V1::WishesController < ApplicationController
  def index
    wishes = Wish.successful_wishes

    render json: wishes
  end

  def create
    wish = Wish.new(wish_params)

    if wish.save
      render json: wish
    else
      render json: wish.errors, status: :bad_request
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:title)
  end
end
