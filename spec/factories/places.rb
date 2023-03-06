FactoryBot.define do
  factory :place do
    name { Faker::Name.name }
    address { Faker::Address.street }
    place_id { Faker::Alphanumeric.alphanumeric(number: 32, min_alpha: 0, min_numeric: 0) }
  end
end
