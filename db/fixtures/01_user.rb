10.times do |n|
  User.seed do |s|
    s.name = Faker::Name.name
    s.email = Faker::Internet.email(domain: 'google.com')
    s.nick_name = Faker::Internet.username
  end
end
