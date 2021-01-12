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
class Manufacturer < ApplicationRecord
  has_many :models, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
