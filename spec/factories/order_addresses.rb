FactoryBot.define do
  factory :order_address do
    postal_code { '111-1111' }
    prefecture_id { 4 }
    city { '横浜市緑区' }
    block { '青山1-1-1' }
    building { '青山ビル101' }
    phone_number { '09011111111' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end

