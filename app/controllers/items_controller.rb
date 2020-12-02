class ItemsController < ApplicationController
  def index
  end

  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :shipping_chages_id, :shipping_area_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
