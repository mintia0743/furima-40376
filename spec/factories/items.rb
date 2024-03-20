FactoryBot.define do
  factory :item do
    name {"オムライス"}
    description{"説明を書きます"}
    category_id { 2 }
    status_id{ 2 }
    shipping_fee_id{ 2 }
    prefecture_id{ 2 }
    scheduled_delivery_id{ 2 }
    association :user
    price {50000}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end