class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number ,:order_id, :user_id, :item_id

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は3桁ハイフン4桁の半角文字列のみ入力してください" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値のみ入力してください" }
  validates :order_id, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  

  def save
    # Orderモデルの保存
    order = Order.create(user_id: user_id, item_id: item_id)
    
    # Addressモデルの保存
    address = Address.create( # rubocop:disable Lint/UselessAssignment
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number,
      order_id: order.id 
    )
  end
end

