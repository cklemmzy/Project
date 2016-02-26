require 'sinatra'


get '/' do 
  erb :Home_page
end 
 
 
get '/login' do
  erb :Login_page
end 

get '/admin' do
  erb :Admin_page
end 
 
get '/logout' do 
  erb :logout
end 


get '/login' do
  erb :Login_page
end 
