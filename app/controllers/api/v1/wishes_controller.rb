class Api::V1::WishesController < ApplicationController
  before_action :set_wish, only: %i[update]

  def index
    wishes = Wish.all.includes(association_tables).order(created_at: :desc)

    render json: wishes.as_json(only: %i[id title score], methods: %i[likes_count])
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

  def association_tables
    %i[likes]
  end
end
