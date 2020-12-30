# == Schema Information
#
# Table name: models
#
#  id              :bigint           not null, primary key
#  battery         :string(255)      not null
#  camera          :string(255)      not null
#  detail          :text(65535)
#  display         :string(255)      not null
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :bigint           not null
#
# Indexes
#
#  index_models_on_manufacturer_id  (manufacturer_id)
#  index_models_on_name             (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#
require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
