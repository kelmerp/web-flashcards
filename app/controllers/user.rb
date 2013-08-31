########## GET ROUTES ##########
get '/user/:id' do
  @decks = Deck.all
  # @user = current_user

  erb :user
end

get '/logout' do
  session.clear

  redirect to "/"
end

########## POST ROUTES ##########
post '/login' do
  @user = User.find_by_email(params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
  else
    @login_errors = "Invalid email address or password"
    erb :index
  end

  redirect to "/user/#{@user.id}"
end

post '/create' do
  user = User.create(params[:user])
  if user
    session[:user_id] = @user.id
  else
    @create_error = "That email already exists, please try again."
    erb :index
  end

  erb :index
end
