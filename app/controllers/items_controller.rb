class ItemsController < ApplicationController
  def index
    # @items = Itme.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :shipping_change_id, :shipping_area_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
