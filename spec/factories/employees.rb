# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  address    :text(65535)      not null
#  birthday   :date             not null
#  email      :string(255)      not null
#  name       :string(255)      not null
#  phone      :string(255)      not null
#  position   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  branch_id  :bigint           not null
#
# Indexes
#
#  index_employees_on_branch_id  (branch_id)
#  index_employees_on_email      (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (branch_id => branches.id)
#
FactoryBot.define do
  factory :employee do
    name { Faker::Name.unique.name }
    position { %w[manager staff].sample }
    branch
    birthday { Faker::Date.birthday(min_age: 18, max_age: 35) }
    phone { Faker::PhoneNumber.cell_phone }
    email { "#{name.split.first.downcase}@gmail.com" }
    address { Faker::Address.full_address }
  end
end
