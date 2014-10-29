get '/decks/:subject' do
  deck = Deck.find_by(subject: params[:subject])
  user = User.find_by(username: session[:username])
  round = Round.create(user_id: user.id, deck_id: deck.id)
  user.update(current_round: round.id)
  session[:round] = round
  erb :deck_list
end
