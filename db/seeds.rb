# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..50).each do
  imei_value = ''
  serial_value = ''
  (1..18).each {imei_value << ['A', 'B', 'C', 'D'].sample}
  (1..9).each {serial_value << rand(1..9).to_s}
  Product.create(
    model_id: Model.pluck(:id).sample,
    memory_id: Memory.pluck(:id).sample,
    color_id: Color.pluck(:id).sample,
    branch_id: Branch.pluck(:id).sample,
    status_id: Status.pluck(:id).sample,
    price: (rand(30..60) * 10),
    imei: imei_value,
    serial_number: serial_value,
    employee_id: Employee.pluck(:id).sample
  )
end
