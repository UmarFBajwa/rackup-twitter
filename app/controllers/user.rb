get '/users' do
  @users = User.all
end


get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @tweets = Tweet.where(user_id: @user.id)
  erb :'tweets/show'
end

