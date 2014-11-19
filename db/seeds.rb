require 'faker'

10.times{User.create!(email: Faker::Internet.email, username: Faker::Name.name, cohort: "Apricots 2015", password_hash: "asdlkf;j`2349hjwef")}

5.times{Subreddit.create!(name: Faker::Hacker.noun, moderator: User.all.sample, description: Faker::Lorem.sentence(5))}

(rand(10..50)).times { Post.create!(title: Faker::Lorem.words(4).join(" "), body: Faker::Lorem.paragraph(3), author: User.all.sample, subreddit: Subreddit.all.sample)}

(rand(25..50)).times {Comment.create(post: Post.all.sample, author: User.all.sample, body: Faker::Lorem.paragraph(1))}

# Votes on posts
(rand(50..100)).times {Vote.create(post: Post.all.sample, voter: User.all.sample, up: [true, true, false].sample)}

#Votes on comments
(rand(50..100)).times{Vote.create(comment: Comment.all.sample, voter: User.all.sample, up: [true, true, false].sample)}

10.times{Subscription.create(user: User.all.sample, subreddit: Subreddit.all.sample)}
