# == Schema Information
#
# Table name: statuses
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_statuses_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :status do
    name { "#{Faker::Number.unique.between(from: 10, to: 99)} %" }
  end
end
