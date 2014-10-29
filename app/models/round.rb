class Round < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  # Remember to create a migration!
  def random_remaining_card
    correct_guesses_array = self.guesses.where(correctness: true)
    correct_guess_id_array = correct_guesses_array.map do |guess|
      guess.card_id
    end
    if correct_guess_id_array == []
      cards = self.deck.cards
    else
      cards = self.deck.cards.where('id not in (?)', correct_guess_id_array)
    end
    cards.sample
  end

end
