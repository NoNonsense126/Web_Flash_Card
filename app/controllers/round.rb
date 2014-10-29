get '/startround' do
  card = session[:round].random_remaining_card
  redirect "/question/#{card.id}"
end

get '/question/:id' do
  @card = Card.find_by(id: params[:id])
  erb :'round/question'
end

post '/answer/:id' do
  round = session[:round]
  guess = Guess.create(card_id: params[:id], round_id: round.id)
  card = Card.find_by(id: params[:id])
  if params["answer"].downcase == card.answer.downcase
    guess.update(correctness: true)
    @correct = "Correct!"
  else
    @correct = "Wrong!"
  end
  if round.cards_correct >= round.deck.cards.count
    erb :'round/won_page'
  elsif round.cards_incorrect >= round.guess_lives
    erb :'round/lost_page'
  else
    @answer = card.answer
    @next_card = session[:round].random_remaining_card
    erb :'round/answer'
  end
end
