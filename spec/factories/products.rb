FactoryBot.define do
  factory :product do
    model
    memory
    color
    branch
    status
    employee
    imei { Faker::Device.unique.serial }
    serial_number { Faker::Number.number(digits: 10) }
    price { rand(40..60) * 10 }
  end
end
