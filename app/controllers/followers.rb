get '/followers/:id' do
  @user = User.find(params[:id])
  erb :'following/show'
end
