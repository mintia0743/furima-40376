FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    image { Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "png") }
    association :category, factory: :category
    association :status, factory: :condition
    association :shipping_fee, factory: :shipping_fee
    association :prefecture, factory: :prefecture
    association :scheduled_delivery, factory: :deliveryday
    price { Faker::Number.between(from: 300, to: 99999999) }
  end
end

FactoryBot.define do
  factory :deliveryday, class: DeliveryDay do
    id { 2 }
    name { "1~2日で発送" }
  end
end
FactoryBot.define do
  factory :condition, class: Condition do
    id { 2 }
    name { "新品・未使用" }
  end
end

FactoryBot.define do
  factory :category, class: Category do
    id { 2 }
    name { "メンズ" }
  end
end

FactoryBot.define do
  factory :prefecture, class: Prefecture do
    id { 2 }
    name { "北海道" }
  end
end

FactoryBot.define do
  factory :shipping_fee, class: ShippingFee do
    id { 2 }
    name { "着払い(購入者負担)" }
  end
end