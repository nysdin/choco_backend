10.times do |n|
  User.seed do |s|
    s.id = n + 1
    s.name = Faker::Name.name
    s.email = Faker::Internet.email(domain: 'google.com')
    s.nick_name = Faker::Internet.username
  end
end
