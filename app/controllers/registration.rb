post '/login' do
  user = User.authenticate(params[:username], params[:password])
  puts "*"*50
  if user
    session[:user_id] = user.id
    redirect "users/#{user.id}"
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/register' do
  erb :"users/new"
end

post '/register' do
  user = User.create(params[:user])
  redirect '/'
end
