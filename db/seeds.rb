require 'faker'

10.times{User.create!(email: Faker::Internet.email,
                      username: Faker::Name.name,
                      cohort: "Apricots 2015",
                      password_hash: "asdlkf;j`2349hjwef")}

5.times{Subreddit.create!(name: Faker::Hacker.noun,
                          moderator: User.all.sample,
                          description: Faker::Lorem.sentence(5))}

git = Subreddit.create!(name: "Git workflow",
                        moderator: User.all.sample,
                        description: "Post your git workflow questions and resources here!")

rspec = Subreddit.create!(name: "Rspec",
                          moderator: User.all.sample,
                          description: "TDD is awesome! TDD is life! Share your favorite rspec stories!")

duke = Subreddit.create!(name: "Duke Greene",
                        moderator: User.all.sample,
                        description: "Favorite Duke quotes and jokes")

gifs = Subreddit.create!(name: "Coding Gifs",
                        moderator: User.all.sample,
                        description: "Sometimes words just don't say enough.")

(rand(10..50)).times { Post.create!(title: Faker::Lorem.words(4).join(" "),
                                    body: Faker::Lorem.paragraph(3),
                                    author: User.all.sample,
                                    subreddit: Subreddit.all.sample)}


Post.create!(title: "I hate rspec",
            body:"I can't get my rspec tests to pass. They are all red. Are there any gems to fix this?",
            author: User.all.sample,
            subreddit: rspec)
Post.create!(title: "cats playing piano",
            body:"<a href='http://giphy.com/search/keyboard-cat'>http://giphy.com/search/keyboard-cat</a>",
            author: User.all.sample,
            subreddit: gifs)
Post.create!(title: "What is a pirate's favorite test?",
            body:"ARspec",
            author: User.all.sample,
            subreddit: duke)
Post.create!(title: "Should I force push everything to master?",
            body:"Seriously. should I? ",
            author: User.all.sample,
            subreddit: git)

(rand(25..50)).times {Comment.create(post: Post.all.sample,
                                    author: User.all.sample,
                                    body: Faker::Lorem.paragraph(1))}
# Votes on posts
(rand(50..100)).times {Vote.create(post: Post.all.sample,
                                  voter: User.all.sample,
                                  up: [true, true, false].sample)}

#Votes on comments
(rand(50..100)).times{Vote.create(comment: Comment.all.sample,
                                  voter: User.all.sample,
                                  up: [true, true, false].sample)}

10.times{Subscription.create(user: User.all.sample, subreddit: Subreddit.all.sample)}
