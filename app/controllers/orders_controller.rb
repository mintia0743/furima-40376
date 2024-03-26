class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
