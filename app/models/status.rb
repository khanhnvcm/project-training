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
class Status < ApplicationRecord
	has_many :products
	validates :name, presence: true, uniqueness: true
end
