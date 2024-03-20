class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, exclusion: { in: [1] }
  validates :status_id, presence: true, exclusion: { in: [1] }
  validates :shipping_fee_id, presence: true, exclusion: { in: [1] }
  validates :prefecture_id, presence: true, exclusion: { in: [1] }
  validates :scheduled_delivery_id, presence: true, exclusion: { in: [1] }
  validates :price, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  },
  format: { with: /\A[0-9]+\z/, message: "は半角数値のみ入力できます" }
  validates :user, presence: true 


  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category, class_name: 'Category'
  belongs_to_active_hash :status, class_name: 'Condition'
  belongs_to_active_hash :shipping_fee, class_name: 'ShippingFee'
  belongs_to_active_hash :prefecture, class_name: 'Prefecture'
  belongs_to_active_hash :scheduled_delivery, class_name: 'DeliveryDay'
end
