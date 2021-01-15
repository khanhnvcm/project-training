FactoryBot.define do
  factory :memory do
    amount { "#{Faker::Number.unique.between(from: 2, to: 1024)} GB" }
  end
end
