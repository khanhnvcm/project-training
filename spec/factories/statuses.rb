FactoryBot.define do
  factory :status do
    name { Faker::Number.unique.between(from: 90, to: 99).to_s + ' %' }
  end
end
