# get '/login/:id' do
#   @login = User.find(params[:id])

# end


post '/login/' do
  erb :"users/show"
end


get '/logout' do

end

get '/register' do
  erb :"users/new"
end

post '/register' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end
