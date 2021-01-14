FactoryBot.define do
  factory :employee do
    name { Faker::Name.unique.name }
    position { %w[manager staff].sample }
    branch
    birthday { Faker::Date.birthday(min_age: 18, max_age: 35) }
    phone { Faker::PhoneNumber.cell_phone }
    email { "#{name.split.first.downcase}@gmail.com" }
    address { Faker::Address.full_address }
  end
end
