# get '/tweets' do
#   @tweet = Tweet.all
# end

get '/tweets/index'do
  @tweet = Tweet.order('id DESC')
  erb :'tweets/index'
end

get '/users/:id/tweets' do
  @user = User.find(params[:id])
  @tweets = @user.tweets.order('id DESC')
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

put '/users/:id/tweets/:tweet_id/edit' do
  Tweet.update(params[:tweet_id], :body => params[:tweet])
  redirect "/users/#{params[:id]}/tweets"
end

delete '/users/:id/tweets/:tweet_id/edit' do
  @tweet = Tweet.find(params[:tweet_id])
  @tweet.destroy
  redirect "/users/#{params[:id]}/tweets"
end
