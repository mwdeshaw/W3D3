# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(email: 'gorilla@banana_mail.com') 
  user2 = User.create!(email: 'potato_man@spud.org') 
  user3 = User.create!(email: 'cheese_man@cheddar.com') 
  user4 = User.create!(email: 'the_coffee@roast.org')

  ShortenedURL.destroy_all
  url1 = ShortenedURL.create!(long_url: 'https://www.reddit.com/r/BananasForScale/', short_url: ShortenedURL.random_code, user_id: user1.id)
  url2 = ShortenedURL.create!(long_url: 'https://www.reddit.com/r/Idaho/', short_url: ShortenedURL.random_code, user_id: user3.id)

end 
