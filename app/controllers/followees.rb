get '/followees/:id' do
  @user = User.find(params[:id])
  @followings = @user.followees
  erb :'following/show'
end
