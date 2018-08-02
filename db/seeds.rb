Trip.create!(name: "Test Trip",
              start_date: "2018-01-01",
              end_date:   "2018-01-30",
              location:   "Haiti")

99.times do |n|
  name       = Faker::Zelda.item
  start_date = Faker::Date.between(45.days.ago, 25.days.ago)
  end_date   = start_date + 14.days
  location   = Faker::Space.galaxy

  Trip.create!(name: name,
                start_date: start_date,
                end_date: end_date,
                location: location)
end

Participant.create!(first_name: "Test",
                     last_name: "Leader",
                     email: "leader@participant.com",
                     phone_number: "1234567890",
                     address: "123 Road",
                     address2: "",
                     city: "Test",
                     state: "TS",
                     zip: "12345",
                     birthdate: "2018-01-01",
                     password: "password",
                     password_confirmation: "password",
                     leader: true)

Participant.create!(first_name: "Test",
                     last_name: "Admin",
                     email: "admin@participant.com",
                     phone_number: "1234567890",
                     address: "123 Road",
                     address2: "",
                     city: "Test",
                     state: "TS",
                     zip: "12345",
                     birthdate: "2018-01-01",
                     password: "password",
                     password_confirmation: "password",
                     leader: true,
                     admin: true)

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "email#{n}@test.com"
  phone_number = "1234567890"
  address =  Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  birthdate = Faker::Date.birthday(10,80)
  password = "password"
  password_confirmation = "password"
  remote_picture_url = Faker::Placeholdit.image.gsub('https://','http://')


  Participant.create!(first_name: first_name,
                      last_name: last_name,
                      email: email,
                      phone_number: phone_number,
                      address:  address,
                      city: city,
                      state: state,
                      zip: zip,
                      birthdate: birthdate,
                      password: password,
                      password_confirmation: password_confirmation,
                      remote_picture_url: remote_picture_url
                      )
end
