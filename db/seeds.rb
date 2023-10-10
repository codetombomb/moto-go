require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



motorcycles = [
    { year: 1950, make: "Harley-Davidson", model: "Panhead" },
    { year: 1960, make: "Honda", model: "CB750" },
    { year: 1970, make: "Kawasaki", model: "Z1" },
    { year: 1980, make: "BMW", model: "R80GS" },
    { year: 1990, make: "Ducati", model: "Monster 900" },
    { year: 2000, make: "Suzuki", model: "GSX-R1000" },
    { year: 2010, make: "Triumph", model: "Street Triple" },
    { year: 1975, make: "Yamaha", model: "RD350" },
    { year: 2003, make: "Kawasaki", model: "Ninja ZX-10R" },
    { year: 1989, make: "Suzuki", model: "GSX-R1100" },
    { year: 1999, make: "Harley-Davidson", model: "Sportster 883" },
    { year: 1967, make: "Triumph", model: "Tiger 100" },
    { year: 2015, make: "Ducati", model: "Multistrada 1200" },
    { year: 2007, make: "Honda", model: "CBR1000RR" },
    { year: 1983, make: "Kawasaki", model: "GPz750" },
    { year: 1979, make: "BMW", model: "R65" },
    { year: 1994, make: "Yamaha", model: "YZF600R" },
    { year: 2018, make: "Suzuki", model: "GSX-S750" },
    { year: 1965, make: "Norton", model: "Atlas" },
    { year: 2006, make: "Triumph", model: "Speed Triple" },
    { year: 1997, make: "Honda", model: "VFR750F" },
    { year: 2012, make: "Kawasaki", model: "Z1000" },
    { year: 1972, make: "Harley-Davidson", model: "FX" },
    { year: 1986, make: "Yamaha", model: "FJ1200" },
    { year: 2009, make: "Ducati", model: "848" },
    { year: 1992, make: "Suzuki", model: "GSX1100G" },
    { year: 2019, make: "Triumph", model: "Scrambler 1200" },
    { year: 1968, make: "Kawasaki", model: "H1 Mach III" },
    { year: 1984, make: "Honda", model: "CBR600F" },
    { year: 2004, make: "Yamaha", model: "FZ6" },
    { year: 2013, make: "BMW", model: "R1200GS" },
    { year: 1971, make: "Ducati", model: "750 GT" },
    { year: 1995, make: "Triumph", model: "Daytona 1200" },
    { year: 2017, make: "KTM", model: "390 Duke" },
    { year: 1969, make: "Suzuki", model: "T500 Titan" },
    { year: 1985, make: "Kawasaki", model: "Ninja 600R" },
    { year: 2005, make: "Yamaha", model: "YZF-R1" },
    { year: 2014, make: "Harley-Davidson", model: "Iron 883" },
    { year: 1976, make: "Triumph", model: "Bonneville T140" },
    { year: 1991, make: "Honda", model: "NT650 Hawk" },
    { year: 2011, make: "Ducati", model: "Diavel" },
    { year: 1973, make: "Suzuki", model: "GT750" },
    { year: 1987, make: "Kawasaki", model: "KLR650" },
    { year: 2008, make: "Yamaha", model: "FZ1" },
    { year: 2016, make: "Triumph", model: "Tiger 800" },
  ]

30.times do
    first_name = Faker::Name.unique.first_name
    last_name = Faker::Name.unique.last_name
    email = "#{first_name.downcase}.#{last_name.downcase}@gmail.com"

    Faker::Config.locale = 'en-US'
    phone_number = "#{Faker::PhoneNumber.area_code}-#{Faker::PhoneNumber.exchange_code}-#{Faker::PhoneNumber.subscriber_number}"
    user = User.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone_number: phone_number,
        password: "password"
    )


    address = Faker::Address.street_address
    state = Faker::Address.state_abbr
    city = "#{Faker::FunnyName.two_word_name} #{Faker::Address.city_suffix.titleize}"
    zip = Faker::Address.zip_code
    country = "USA"

    location = Location.create(
        address_line_1: address,
        city: city,
        state_province: state,
        zip_postal_code: zip,
        country: country
    )
    location.user = user
    location.save


    rand(1..3).times do
        bike = motorcycles.sample
        vehicle = Vehicle.create(
            year: bike["year"],
            make: bike["make"],
            model: bike["model"],
            miles: rand(50..50000)
        )
       vehicle.owner = user
       user.bikes << vehicle
       vehicle.save
    end

end