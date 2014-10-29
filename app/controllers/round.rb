get '/startround' do
  card = session[:round].random_remaining_card
  redirect "/question/#{card.id}"
end

get '/question/:id' do
  @card = Card.find_by(id: params[:id])
  erb :'round/question'
end

post '/answer/:id' do
  session[:round].id
  guess = Guess.create(card_id: params[:id], round_id: session[:round].id)
  if params["answer"] == Card.find_by(id: params[:id]).answer
    @test = true
  else
    @test = false
  end
  erb :test
end
