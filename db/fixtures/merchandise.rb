10.times do |n|
  Merchandise.seed do |s|
    s.id = n + 1
    s.title = Faker::Lorem.word
    s.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
    s.price = rand(0..10000)
  end
end
