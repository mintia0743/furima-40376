FactoryBot.define do
  factory :order_address do
    postal_code { '111-1111' }
    prefecture_id { 4 }
    city { '横浜市緑区' }
    block { '青山1-1-1' }
    building { '' }
    phone_number { '09011111111' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id{ 3 }
    item_id{ 2 }
  end
end
