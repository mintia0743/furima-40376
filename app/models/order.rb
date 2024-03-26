class Order < ApplicationRecord
  after_create :mark_item_as_sold_out
    belongs_to :user
    belongs_to :item
    has_one :address
  
    private

  def mark_item_as_sold_out
    item.update(sold_out: true)
  end
end