FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "user#{n}" }
    email { Faker::Internet.unique.email } # 一意のメールアドレスを生成
    password { 'password123' }
    password_confirmation { 'password123' }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name.yomi } # ランダムなカタカナの苗字
    first_name_kana { Faker::Japanese::Name.first_name.yomi } # ランダムなカタカナの名前
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }

    trait :admin do
      admin { true }
    end
  end
end