########## GET ROUTES ##########
get '/user/:id' do
  @decks = Deck.all
  # @user = current_user

  erb :user
end

########## POST ROUTES ##########
post '/login' do
  puts "Params is #{params.inspect}"
  @user = User.find_by_email(params[:user][:email])
  puts "User is #{@user.inspect}"

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    puts "YAY!!!!"
  else
    @errors = "Invalid username or password"
    puts "NAYYY!"
    erb :index
  end

  redirect to "/user/#{@user.id}"
end

get '/logout' do
  session.clear

  redirect to "/"
end
