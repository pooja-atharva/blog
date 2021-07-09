# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
10.times do |i|
  users << User.new(email: "user_#{i}@abcd.com",password: "123123", password_confirmation: "123123")
end
User.import users 
p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{User.count}"
posts = []
User.all.each do |user|
    10.times do |i|
        post = Post.new(name: "post_#{i}_#{user.id}", user_id: user.id)
        post.comments.build(name: "comment #{i}", user_id: user.id)
        posts << post
    end
end
Post.import posts, recursive: true 
p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{Post.count}"
p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{Comment.all.count}"
comments = []
User.all.each do |user|
    user.posts.each do |post|
        10.times do |i|
            comments << post.comments.build(name: "comment #{i}", user_id: user.id)
        end
    end
end
Comment.import comments
p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{Comment.count}"