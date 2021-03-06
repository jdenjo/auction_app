# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

Bid.destroy_all
Auction.destroy_all
User.destroy_all

super_user = User.create(
  first_name: "John",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  admin: true,
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD,
  )
end

users = User.all

10.times do
  created_at = Faker::Date.backward(365 * 5)

  p = Auction.create(
    title: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample,
    reserve: rand(1..1000),
    end: Faker::Date.forward(5),
  )

  if p.valid?
    p.bids = rand(0..15).times.map do
      Bid.new(amount: rand(0..1000), user: users.sample)
    end
  end
end
