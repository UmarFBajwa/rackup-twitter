10.times {
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password(5), email: Faker::Internet.free_email)
}

20.times {
  Tweet.create(body: Faker::Lorem.sentence(3), user_id: rand(1..10))
}

20.times {
  Following.create(follower_id: rand(1..10), followee_id: rand(1..10))
}
