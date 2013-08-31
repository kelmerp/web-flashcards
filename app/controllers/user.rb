########## GET ROUTES ##########
get '/user/:id' do
  @decks = Deck.all

  erb :user
end

get '/logout' do
  session.clear

  redirect to "/"
end

get '/user/edit/:id' do

  erb :edit_user
end

########## POST ROUTES ##########
post '/login' do
  @user = User.find_by_email(params[:user][:email])
  p @user

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to "/user/#{@user.id}"

  else
    @login_errors = "Princess Ruby is Sad now.  You have entered\
    and invalid email address or password"
    erb :index
  end

  end

post '/create' do
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
  else
    @create_errors = "Princess Ruby is sad.  You must fill out the entire form\
     and enter a valid email and matching password."
    erb :index
  end

  redirect to "/user/#{current_user.id}"
end

post '/update' do
  if current_user.update_attributes(params[:user])
    redirect to "/user/#{current_user.id}"
  else
    @update_errors = "Princess Ruby is sad.  You must fill out the entire form\
     and enter a valid email and matching password."
    erb :edit_user
  end
end
