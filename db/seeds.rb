# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


10.times do 
    friendstables = Friendstable.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.free_email,
        phone: Faker::PhoneNumber.cell_phone,
        twitter: Faker::Twitter.screen_name,
        user_id: 1
        
    )
    friendstables.save
end

4.times do 
    categories = Category.new(
    category: Faker::App.name
    
    )
    categories.save
end

6.times do 
    posts = Post.new(
    title: Faker::Hipster.word,
    content: Faker::Hipster.sentence,
    category_id: 4,
    user_id: 1

    )
    posts.save
end

3.times do 
    comments = Comment.new(
    name: Faker::Hipster.word,
    content: Faker::Hipster.sentence,
    user_id: 1,
    post_id: 2

    )
    comments.save
end
