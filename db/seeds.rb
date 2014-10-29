require_relative '../config/environment'
deck = Deck.create(subject: "eng-malay")


File.open("db/english-malay.txt", "r") do |f|
  f.each do |row|
    row = row.chomp.split("\t")
    Card.create(deck_id: deck.id, question: row[0], answer: row[1])
  end
end