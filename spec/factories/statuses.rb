FactoryBot.define do
  factory :status do
    name { "#{rand(95..99)} %" }
  end
end
