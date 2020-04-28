# Create a the admin user.
Customer.create!(name:  "Wilmir Nicanor",
             email: "wbnicanor01@gmail.com",
             address: "Dublin, Ireland",
             mobile_number: "+353831234567",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
20.times do |n|
  name  = Faker::TvShows::RuPaul.queen
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
customers = Customer.order(:created_at).take(10)

customers.each do |customer|
    10.times do |n|
        issue_type = "Refund"
        issue_rand = rand(1..5)
        
        case issue_rand
        when 1
            issue_type = "Book A Game"
        when 2
            issue_type = "Cancel Booking"
        when 3
            issue_type = "Refund"
        when 4
            issue_type = "Feedback"
        when 5
            issue_type = "Other"
        end

        status = Faker::Subscription.status
        title = Faker::Sports::Football.competition + " : " + Faker::Sports::Football.team + " vs "  + Faker::Sports::Football.team 
        description = Faker::TvShows::TheITCrowd.quote
        customer.issues.create!(issue_type:  issue_type,
                                status:  status,
                                title: title,
                                description: description)
    end
end