# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.create([{email: 'adam.autor@test.pl' , password:'1234567'},{email: 'barbara.autor@test.pl' , password:'654321'},{email: 'cecylia.autor@test.pl' , password:'654321'}])


5.times do
  Post.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    published_at: Faker::Date.backward(days: 365),
    author: Author.all.sample
  )
end

Category.create(title: 'Category 1')
Category.create(title: 'Category 2')
Category.create(title: 'Category 3')
