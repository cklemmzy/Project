class User
  attr_accessor :username , :password

  def self.authenticate (username, password)
   	user = "username"
    pass = "password"

     if user && password == "admin"
       puts "welcome sir"
     else
       nil
     end
   end
 end

#user_conroller

  def new 
    @user= User.new
  end

  def create (username, password)
  @user = User.new (params[:username])
  user.pass = params[:password]
  if username = "admin" && user.pass = "admin"
    puts  "redirect_to_admin_url, welcome"
  else
    redirect_to_staff_url
       #sessions_controller
  def session
  user = User.authenticate (params[:username])
  user.pass =    (params[:password])
  session[:username] = user.id

 if username = "admin" && user.pass = "admin"
   redirect_to_admin_url
  else
    redirect_to_staff url
  end
end


def destroy
  session[:username] = nil
  redirect_to_logout_url
end


def request

    if @username == "admin" && @password == "admin"
      get '/login' do 
      erb :welcome
     end
     else 
      get '/logout' do 
        "you are not authorised to view page"
     end
  end 
end

def maintainance 
  if @username == "admin" && @password == "admin"
    post '/new' do
    erb :track_sheet
end
  else 
    post '/staff'
  end
end
end
end