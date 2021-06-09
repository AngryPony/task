
5.times do
  country = Country.create(name: Faker::Address.country)
  5.times do
    region = Region.create(country: country, name: Faker::Address.state)
    5.times do
      city = City.create(region: region, name: Faker::Address.city)
      5.times do
        Campsite.create(region: region, city: city, name: Faker::Games::Witcher.location, description: Faker::TvShows::Simpsons.quote )
      end
    end

    2.times do
      Campsite.create(region: region, city: nil, name: Faker::Fantasy::Tolkien.location, description: Faker::TvShows::Simpsons.quote)
    end

  end
end

