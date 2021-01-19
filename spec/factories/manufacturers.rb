# == Schema Information
#
# Table name: manufacturers
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_manufacturers_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :manufacturer do
    name { Faker::Name.unique.name }
  end
end
