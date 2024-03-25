class Address < ApplicationRecord
  belongs_to:order
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true
end
