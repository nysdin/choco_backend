36.times do |n|
  Merchandise.seed do |s|
    s.id = n + 1
    s.title = Faker::Lorem.word
    s.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
    s.price = rand(0..10_000)
    s.seller_id = rand(1..10)
    s.image = "https://images-fe.ssl-images-amazon.com/images/I/5177J3OxO6L._SX218_BO1,204,203,200_QL40_ML2_.jpg"
  end
end
