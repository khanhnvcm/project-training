FactoryBot.define do
  factory :manufacturer do
    name { Faker::Device.unique.manufacturer }
  end
end
