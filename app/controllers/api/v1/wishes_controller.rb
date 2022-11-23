class Api::V1::WishesController < ApplicationController
  before_action :set_wish, only: %i[update]

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

  def update
    if @wish.update(score_params)
      render json: @wish
    else
      render json: @wish.errors, status: :bad_request
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:title)
  end

  def score_params
    params.require(:wish).permit(:success, :score)
  end

  def set_wish
    @wish = Wish.find(params[:id])
  end
end
