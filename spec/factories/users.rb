FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    api_key { Faker::Alphanumeric.alphanumeric(number: 32, min_alpha: 0, min_numeric: 0) }
  end
end
