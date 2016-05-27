get '/followers/:id' do
  @user = User.find(params[:id])
  @followings = @user.followers
  erb :'following/show'
end
