FactoryBot.define do
  factory :model do
    name { Faker::Device.unique.model_name }
    manufacturer
    display { "#{rand(4.0..6.0).round(2)} inches" }
    camera { "#{rand(10..20)} MP" }
    battery { "#{rand(20..40) * 100} mAh" }
  end
end
