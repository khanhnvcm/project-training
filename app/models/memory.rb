# == Schema Information
#
# Table name: memories
#
#  id         :bigint           not null, primary key
#  amount     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memories_on_amount  (amount) UNIQUE
#
class Memory < ApplicationRecord
  has_many :products, dependent: :restrict_with_error

  validates :amount, presence: true, uniqueness: { case_sensitive: true }
end
