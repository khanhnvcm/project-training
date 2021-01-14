FactoryBot.define do
  factory :color do
    name { Faker::Color.unique.color_name }
  end
end
