get '/quote' do 
  @date_default = Date.today
  erb :quote
end