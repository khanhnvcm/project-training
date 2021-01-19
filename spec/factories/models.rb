# == Schema Information
#
# Table name: models
#
#  id              :bigint           not null, primary key
#  battery         :string(255)      not null
#  camera          :string(255)      not null
#  detail          :text(65535)
#  display         :string(255)      not null
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :bigint           not null
#
# Indexes
#
#  index_models_on_manufacturer_id  (manufacturer_id)
#  index_models_on_name             (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#
FactoryBot.define do
  factory :model do
    name { Faker::Device.unique.model_name }
    manufacturer
    display { "#{rand(4.0..6.0).round(2)} inches" }
    camera { "#{rand(10..20)} MP" }
    battery { "#{rand(20..40) * 100} mAh" }
  end
end
