FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "user#{n}" }
    email { Faker::Internet.email }
    password { 'password123' }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { 'ヤマダ' } # カタカナでの苗字
    first_name_kana { 'タロウ' } # カタカナでの名前
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }

    trait :admin do
      admin { true }
    end
  end
end