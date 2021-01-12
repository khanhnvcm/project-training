# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

### Branches
(1..4).each do |x|
  Branch.create(
    name: "HCM #{x}",
    city: 'Ho Chi Minh',
    address: "#{rand(100..400)} Route#{x} Street, District #{x}, HCM city",
    phone: "09#{x}-#{x}#{x}#{x}#{x}-#{x}#{x}#{x}",
    email: "hcm#{x}@gmail.com"
  )
end

### Manufacturers
%w[Apple Samsung Oppo Sony].each do |x|
  Manufacturer.create(name: x.to_s)
end

### Models
model_name = [
  ['IPhone X', 'IPhone Xs max', 'IPhone 11', 'IPhone 11 Pro max', 'Iphone 8', 'IPhone 7'],
  ['Samsung Galaxy S20', 'Samsung Galaxy S10', 'Samsung Galaxy A51'],
  ['Oppo A53', 'Oppo Neo 7', 'Oppo R7s'],
  ['Sony Xperia XZ2', 'Sony Xperia L2', 'Sony Xperia XA2']
]
model_name.each_with_index do |manu, index|
  manu.each do |model|
    Model.create(
      manufacturer_id: (index + 1),
      name: model,
      display: ['4.5 inches', '5 inches', '5.5 inches'].sample.to_s,
      camera: "#{rand(10..20)} MP",
      battery: "#{rand(20..30) * 100} mAh"
    )
  end
end

### Colors
['Black', 'Purple', 'Red', 'Grey', 'Blue', 'Yellow', 'Orange', 'Green', 'Dark Blue'].each do |x|
  Color.create(name: x.to_s)
end

### Memories
%w[8GB 16GB 32GB 64GB 128GB 256GB].each do |x|
  Memory.create(amount: x.to_s)
end

### Statuses
['< 95%', '95% - 98%', '99%', 'like new'].each do |x|
  Status.create(name: x.to_s)
end

### Employees
%w[Khanh Nam Hieu Binh Viet Hoa Thuan Tien Thang Tuan Hung Vu].each do |x|
  Employee.create(
    name: x.to_s,
    position: %w[Manager Staff].sample.to_s,
    branch_id: Branch.pluck(:id).sample,
    birthday: Time.now.to_date - rand(7500..13_000).day,
    phone: "09-#{rand(1000..9999)}-#{rand(1000..9999)}",
    email: "#{x.downcase}@gmail.com",
    address: "District #{rand(1..10)}"
  )
end

### Products
100.times do
  imei_value = ''
  serial_value = ''
  18.times { imei_value << %w[A B C D].sample }
  9.times { serial_value << rand(1..9).to_s }
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
