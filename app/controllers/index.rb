use Rack::Session::Cookie,:secret => "hello"
# enable :session

def login?
  !session[:username].nil?
end

def username
  return session[:username]
end

get '/' do
  # Look in app/views/index.erb
  @decks = Deck.all
  erb :index
end

get "/signup" do
  erb :signup
end

post "/signup" do
  User.create(username: params[:username],password: params[:password])

  session[:username] = params[:username]
  redirect "/"
end

post "/login" do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:username] = @user[:username]
    redirect "/"
  end
  erb :error
end

get "/logout" do
  session[:username] = nil
  redirect "/"
end
