# == Schema Information
#
# Table name: memories
#
#  id         :bigint           not null, primary key
#  amount     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memories_on_amount  (amount) UNIQUE
#
FactoryBot.define do
  factory :memory do
    amount { "#{Faker::Number.unique.between(from: 2, to: 1024)} GB" }
  end
end
