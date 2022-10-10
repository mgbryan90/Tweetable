require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy models"
Comment.destroy_all
Tweet.destroy_all
User.destroy_all

puts "Start seeding"

10.times do
  user = User.new(email: Faker::Internet.unique.safe_email, password: "123456", username: Faker::Internet.unique.username, name: Faker::Name.unique.name)
  user.avatar.attach(io: File.open("app/assets/images/users/tanos.png"), filename: "Tanos")
  user.save
end
users = User.all
users.each do |user|
  rand(2..3).times do
    tweet = user.tweets.create(body: Faker::Lorem.paragraph)
  end
end
tweets = Tweet.all
users.each do |user|
  tweets.each do |tweet|
    rand(2..4).times do
    comment = user.comments.create(body: Faker::Lorem.paragraph, tweet: tweet)
    end
  end
end

puts "End seeding"