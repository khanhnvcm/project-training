# == Schema Information
#
# Table name: memories
#
#  id         :bigint           not null, primary key
#  amount     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memories_on_amount  (amount) UNIQUE
#
require 'test_helper'

class MemoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
