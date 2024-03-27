class Order < ApplicationRecord
  after_create :mark_item_as_sold_out
    belongs_to :user
    belongs_to :item
    has_one :address
end