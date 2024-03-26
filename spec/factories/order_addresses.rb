FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    postal_code{111-1111}
    prefecture_id{ 4 }
    city{"横浜市緑区"}
    block{"青山1-1-1"}
    building{""}
    phone_number{"090-1111-1111"}
  end
end
