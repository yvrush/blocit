require 'random_data'

# Create Posts
50.times do
# #1
  Post.create!(
# #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do

  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create Questions
100.times do
  Question.create!(

    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

puts "Seed finished"
puts "#{Post.count} Posts created"
puts "#{Comment.count} Comments created"
puts "#{Question.count} Questions created"
