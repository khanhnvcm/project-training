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
class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :products, dependent: :restrict_with_error

  has_many_attached :images

  validates :name, :battery, :camera, :display, presence: true
  validates :name, uniqueness: true
end
