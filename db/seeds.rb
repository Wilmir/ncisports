# Create a the admin user.
Customer.create!(name:  "Wilmir Nicanor",
             email: "wbnicanor01@gmail.com",
             address: "Dublin, Ireland",
             mobile_number: "+353831234567",
             password:              "password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
300.times do |n|
    name_rand = rand(1..5)
    name  = Faker::TvShows::RuPaul.queen
    case name_rand
    when 1
        name = Faker::TvShows::GameOfThrones.character
    when 2
        name = Faker::Sports::Basketball.player
    when 3
        name = Faker::TvShows::Simpsons.character
    when 4
        name = Faker::TvShows::StrangerThings.character
    when 5
        name  = Faker::TvShows::RuPaul.queen
    end

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
        issue_type = "Request A Refund"
        issue_rand = rand(1..5)
        case issue_rand
        when 1
            issue_type = "Book A Game"
        when 2
            issue_type = "Cancel Booking"
        when 3
            issue_type = "Request A Refund"
        when 4
            issue_type = "Feedback"
        when 5
            issue_type = "Other"
        end

        status = "New"
        status_rand = rand(1..3)
        case status_rand
        when 1
            status = "New"
        when 2
            status = "Pending"
        when 3
            status = "Resolved"
        end

        description = Faker::TvShows::TheITCrowd.quote
        description_rand = rand(1..3)
        case description_rand
        when 1
            description = Faker::TvShows::TheITCrowd.quote + " " + Faker::TvShows::RuPaul.quote
        when 2
            description = Faker::TvShows::StrangerThings.quote + " " + Faker::TvShows::TheITCrowd.quote
        when 3
            description = Faker::TvShows::RuPaul.quote + " " + Faker::TvShows::StrangerThings.quote
        end


        title = Faker::Sports::Football.competition + " : " + Faker::Sports::Football.team + " vs "  + Faker::Sports::Football.team 
        customer.issues.create!(issue_type:  issue_type,
                                status:  status,
                                title: title,
                                description: description)
    end
end