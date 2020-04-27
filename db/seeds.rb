# Create a main sample user.
Customer.create!(name:  "Wilmir Nicanor",
             email: "wbnicanor01@gmail.com",
             address: "Dublin, Ireland",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
199.times do |n|
  name  = Faker::Name.unique.name
  email = "customer-#{n+1}@ncisports.org"
  address = Faker::Address.full_address
  password = "password"
  Customer.create!(name:  name,
               email: email,
               address: address,
               password:              password,
               password_confirmation: password)
end