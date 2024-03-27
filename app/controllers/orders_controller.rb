class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :check_order_existence, only: [:index]
  before_action :check_item_ownership, only: [:index]

  def index
    if user_signed_in?
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_address = OrderAddress.new
    else
      redirect_to new_user_session_path, alert: 'ログインしてください'
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order_address.item_id = @item.id 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  
    if @order_address.valid? 
      pay_item
      @order_address.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      render 'index', status: :unprocessable_entity 
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, token: params[:token])      
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_order_existence
    if user_signed_in? && Order.exists?(item_id: params[:item_id])
      redirect_to root_path, alert: '売却済みの商品は購入できません'
    end
  end

  def check_item_ownership
    if user_signed_in? && current_user == @item.user
      redirect_to root_path, alert: '自身が出品した商品は購入できません'
    end
  end
end
