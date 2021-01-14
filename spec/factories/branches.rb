FactoryBot.define do
  factory :branch do
    name { Faker::Name.unique.initials }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone }
    email { "#{name}@gmail.com" }
  end
end
