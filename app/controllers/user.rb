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
    @login_errors = "Princess Ruby is Sad now.  You have entered\
    and invalid email address or password"
    erb :index
  end

  redirect to "/user/#{@user.id}"
end

post '/create' do
  user = User.new(params[:user])
  user = user.save
  if user
    session[:user_id] = @user.id
  else
    @create_errors = "Princess Ruby is sad.  You must fill out the entire form\
     and enter a valid email and matching password."
    erb :index
  end

  erb :index
end
