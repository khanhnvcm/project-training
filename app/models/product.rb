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
class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :model
  belongs_to :memory
  belongs_to :color
  belongs_to :branch
  belongs_to :status
  belongs_to :employee
  has_many :import_histories, dependent: :destroy
  
  validates :imei, :price, :serial_number, presence: true
  validates :imei, uniqueness: true
  validates :price, numericality: { greater_than: 0 }

  
  after_commit :create_import_history, on: [:create, :update]

  private

	def create_import_history
    ImportHistory.create(product_id: self.id, branch_id: self.branch_id)
  end
end
