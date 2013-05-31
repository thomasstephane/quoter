get '/quote' do 
  @date_default = Date.today
  erb :quote
end

post '/quote' do 
  @quote = Quote.create(params[:quote])
  erb :_customer
end

get '/customer' do 
  erb :_customer
end