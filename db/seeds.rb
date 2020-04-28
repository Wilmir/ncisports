# Create a main sample user.
Customer.create!(name:  "Wilmir Nicanor",
             email: "wbnicanor01@gmail.com",
             address: "Dublin, Ireland",
             mobile_number: "+353831234567",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
20.times do |n|
  name  = Faker::Name.unique.name
  email = "customer-#{n+1}@ncisports.com"
  address = Faker::Address.full_address
  mobile_number = Faker::PhoneNumber.cell_phone
  password = "password"
  Customer.create!(name:  name,
               email: email,
               address: address,
               mobile_number: mobile_number,
               password:              password,
               password_confirmation: password)
end

# Generate a bunch of issues
customers = Customer.order(:created_at).take(5)
20.times do |n|
    issue_type = "Refund"
    status = Faker::Subscription.status
    title = Faker::Sports::Football.competition
    description = Faker::Lorem.paragraph(sentence_count: 2)
    customers.each do |customer|
        customer.issues.create!(issue_type:  issue_type,
                                status:  status,
                                title: title,
                                description: description)
    end
end