FactoryBot.define do
  factory :branch do
    sequence(:name) { |n| "HCM#{n}" }
    city { 'HCM city' }
    sequence(:address) { |n| "District #{n}" }
    sequence(:phone) { |n| "09#{n}-#{n}#{n}#{n}#{n}-#{n}#{n}#{n}" }
    email { Faker::Internet.email }
  end
end