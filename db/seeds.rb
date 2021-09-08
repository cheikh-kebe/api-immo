cities = ["Paris", "Marseille", "Montpellier"]

15.times do
  User.create(email: Faker::Internet.email, password: '123456')
end

10.times do
    RealEstateAd.create(
      title: Faker::Address.street_name, 
      city: cities.sample, 
      description: Faker::Lorem.paragraph, 
      user: User.all.sample, 
      price: rand(100000..1000000)
    )
end