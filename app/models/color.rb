# == Schema Information
#
# Table name: colors
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_colors_on_name  (name) UNIQUE
#
class Color < ApplicationRecord
  has_many :products, dependent: :restrict_with_error

  has_one_attached :image

  validates :name, presence: true, uniqueness: true
end
