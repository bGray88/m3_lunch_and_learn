FactoryBot.define do
  factory :favorite do
    country { Faker::Address.country }
    recipe_link { Faker::Internet.ip_v4_address }
    recipe_title { Faker::Food.dish }
    user
  end
end
