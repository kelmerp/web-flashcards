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
