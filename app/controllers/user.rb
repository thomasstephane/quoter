#----------- SESSIONS -----------

post '/session' do
  login_user(params)
end

delete '/session' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/user/new' do
  erb :sign_up
end

post '/user' do
  create_user(params[:user])
  redirect '/'
end

post '/user/uniq' do
  content_type :json
  puts "in the post uniq"
  puts params.inspect
  puts check_exist(params[:user]).inspect
  check_exist(params[:user]).to_json
end
