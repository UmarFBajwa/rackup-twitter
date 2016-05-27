get '/followees/:id' do
  @user = User.find(params[:id])
  @followings = @user.followees
  erb :'following/show'
end

post '/followees/:id' do
  @user = User.find(params[:id])

  if session[:user_id] == @user.id
    redirect "/users/#{@user.id}/tweets"
  elsif !(Following.where(follower_id: session[:user_id], followee_id: @user.id).empty?)
    redirect "/users/#{@user.id}/tweets"
  else
    new_follow = Following.new(follower_id: session[:user_id], followee_id: @user.id)
    new_follow.save
  end
  redirect "/followees/#{session[:user_id]}"
end

delete '/followees/:id' do
  @user = User.find(params[:id])
  destroy_follow = Following.find_by(follower_id: session[:user_id], followee_id: @user.id)
  destroy_follow.destroy
    redirect "/followees/#{session[:user_id]}"
end
