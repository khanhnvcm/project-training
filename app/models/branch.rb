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
class Branch < ApplicationRecord
  has_many :products, dependent: :restrict_with_error
  has_many :employees, dependent: :restrict_with_error
  has_many :import_histories, dependent: :restrict_with_error

  validates :name, :city, :address, :phone, :email, presence: true
  validates :name, :email, uniqueness: { case_sensitive: true }
end
