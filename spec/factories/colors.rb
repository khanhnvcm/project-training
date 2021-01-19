# == Schema Information
#
# Table name: colors
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_colors_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :color do
    name { Faker::Color.unique.color_name }
  end
end
