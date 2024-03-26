class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id]) # アイテムを取得する
    @order_address = OrderAddress.new(order_params)
    @order_address.item_id = @item.id # item_idを設定する

    if @order_address.valid? 
       @order_address.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      render 'index', status: :unprocessable_entity # エラーメッセージを表示するビューを指定する
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)      
  end
end
