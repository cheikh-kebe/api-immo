15.times do
    User.create(email: Faker::Internet.email, password: '123456')
end

10.times do
    RealEstateAd.create(title: Faker::Book.title, description: Faker::Lorem.paragraphs(number: 1), user: User.all.sample, price: rand(10000..1000000000))
end