get '/tweets' do
  @tweet = Tweet.all
end

get '/users/:id/tweets' do
  @user = User.find(params[:id])
  erb :'tweets/show'
end

post '/users/:id/tweets' do
  @user = User.find(params[:id])
  @tweet = Tweet.new(body: params[:body], user_id: @user.id)
  if @tweet.save
    redirect "/users/#{@user.id}/tweets"
  else
    redirect "/users/show"
  end
end


