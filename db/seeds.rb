#require 'random_data'

# Create Topics
 2.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

# Create Posts
10.times do
  Post.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Sponsored posts
20.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: 10

  )
end
sponsored_posts = SponsoredPost.all

# Create Comments
30.times do

  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create Questions
20.times do
  Question.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

puts "Seed finished"
puts "#{Post.count} Posts created"
puts"#{SponsoredPost.count} Sponsored Posts created"
puts "#{Topic.count} topics created"
puts "#{Comment.count} Comments created"
puts "#{Question.count} Questions created"
