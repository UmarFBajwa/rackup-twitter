get '/users/:id/tweets' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :'tweets/show'
end



post '/users/:id/tweets' do
  @user = User.find(params[:id])
  @tweet = Tweet.new(body: params[:body])
  if @tweet.save
    redirect "/users/#{@user.id}/tweets"
  else
    redirect "/users/show"
  end
end
