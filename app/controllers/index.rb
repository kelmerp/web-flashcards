get '/' do
  if current_user
    redirect to "/user/#{current_user.id}"
  end

  erb :index
end
