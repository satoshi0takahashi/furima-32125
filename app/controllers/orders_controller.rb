class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :correct_post]
  before_action :correct, only: :index
  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    pay_item
    @user_order.save
      if @user_order.valid?
      redirect_to root_path
      else
        render :index
      end
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :shipping_area_id, :city, :address, :building, :phone_number, :order_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def correct
    unless user_signed_in?
      redirect_to new_user_session_path
    end

    if @item.order.present? && user_signed_in?
      redirect_to root_path
    elsif user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end