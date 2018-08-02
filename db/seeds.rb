Trip.create!(name: "Test Trip",
              start_date: "2018-01-01",
              end_date:   "2018-01-30",
              location:   "Haiti")

99.times do |n|
  name       = Faker::Zelda.item
  start_date = Faker::Date.between(45.days.ago, 25.days.ago)
  end_date   = Faker::Date.between(24.days.ago, Date.today)
  location   = Faker::Space.galaxy

  Trip.create!(name: name,
                start_date: start_date,
                end_date: end_date,
                location: location)
end