# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  available     :boolean          default(TRUE)
#  description   :text(65535)
#  imei          :string(255)      not null
#  price         :integer          not null
#  serial_number :string(255)      not null
#  sold          :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  branch_id     :bigint           not null
#  color_id      :bigint           not null
#  employee_id   :bigint           not null
#  memory_id     :bigint           not null
#  model_id      :bigint           not null
#  status_id     :bigint           not null
#
# Indexes
#
#  index_products_on_branch_id               (branch_id)
#  index_products_on_color_id                (color_id)
#  index_products_on_employee_id             (employee_id)
#  index_products_on_imei_and_serial_number  (imei,serial_number) UNIQUE
#  index_products_on_memory_id               (memory_id)
#  index_products_on_model_id                (model_id)
#  index_products_on_status_id               (status_id)
#
# Foreign Keys
#
#  fk_rails_...  (branch_id => branches.id)
#  fk_rails_...  (color_id => colors.id)
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (memory_id => memories.id)
#  fk_rails_...  (model_id => models.id)
#  fk_rails_...  (status_id => statuses.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
