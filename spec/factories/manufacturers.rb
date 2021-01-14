FactoryBot.define do
  factory :manufacturer do
    name { Faker::Device.unique.model_name.split.first }
  end
end
