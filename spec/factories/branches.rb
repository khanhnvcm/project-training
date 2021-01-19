# == Schema Information
#
# Table name: branches
#
#  id         :bigint           not null, primary key
#  address    :text(65535)      not null
#  city       :string(255)      not null
#  email      :string(255)      not null
#  name       :string(255)      not null
#  phone      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_branches_on_name_and_email  (name,email) UNIQUE
#
FactoryBot.define do
  factory :branch do
    name { Faker::Name.unique.initials }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone }
    email { "#{name}@gmail.com" }
  end
end
