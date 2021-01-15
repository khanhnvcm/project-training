FactoryBot.define do
  factory :memory do
    amount { (2 ** Faker::Number.unique.between(from: 3, to: 8)).to_s + ' GB' }
  end
end
