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
class Employee < ApplicationRecord
  belongs_to :branch
  has_many :products
end
