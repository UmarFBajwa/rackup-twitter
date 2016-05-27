get '/followees/:id' do
  @user = User.find(params[:id])
  @followings = @user.followees
  erb :'following/show'
end

post '/followees/:id' do
  @user = User.find(params[:id])
  new_follow = Following.new(follower_id: session[:user_id], followee_id: @user.id)
  if session[:user_id] == @user.id
    redirect "/users/#{@user.id}/tweets"
  elsif Following.where(follower_id: session[:user_id], followee_id: @user.id)
    redirect "/users/#{@user.id}/tweets"
  else
    new_follow.save
  end

end
