# == Schema Information
#
# Table name: import_histories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  branch_id  :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_import_histories_on_branch_id   (branch_id)
#  index_import_histories_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (branch_id => branches.id)
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class ImportHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
