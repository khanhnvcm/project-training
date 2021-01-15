FactoryBot.define do
  factory :manufacturer do
    name { Faker::Name.unique.name }
  end
end
