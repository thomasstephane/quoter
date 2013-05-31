#----------- SESSIONS -----------

post '/session' do
  content_type :json
  login_user(params[:user]).to_json
end

delete '/session' do
  session.clear
end

#----------- USERS -----------
post '/user' do
  create_user(params[:user]).to_json
end

post '/user/uniq' do
  content_type :json
  puts "in the post uniq"
  puts params.inspect
  puts check_exist(params[:user]).inspect
  check_exist(params[:user]).to_json
end

