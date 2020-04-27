# Create a main sample user.
Customer.create!(name:  "Wilmir Nicanor",
             email: "wbnicanor01@gmail.com",
             address: "Dublin, Ireland",
             mobile_number: "+353831234567",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.unique.name
  email = "customer-#{n+1}@ncisports.com"
  address = Faker::Address.full_address,
  mobile_number = Faker::PhoneNumber.cell_phone,
  password = "password"
  Customer.create!(name:  name,
               email: email,
               address: address,
               mobile_number: mobile_number,
               password:              password,
               password_confirmation: password)
end