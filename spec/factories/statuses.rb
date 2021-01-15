FactoryBot.define do
  factory :status do
    name { "#{Faker::Number.unique.between(from: 10, to: 99)} %" }
  end
end
