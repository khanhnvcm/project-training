FactoryBot.define do
  factory :memory do
    amount { "#{2**rand(3..8)} GB" }
  end
end
