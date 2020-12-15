helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end
get '/' do
     @finstagram_posts = FinstagramPost.order(created_at: :desc)
        erb(:index)
end
 
get '/signup' do
    @user = User.new
    erb(:signup)
end


post '/signup' do

  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    "User #{username} saved!"
  else
    erb(:signup)
  end
end
get '/login' do
    erb(:login)
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/')
 end

post '/login' do
 username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)

  
  if @user && @user.password == password
    session[:user_id] = @user.id
    "Success! User with id #{session[:user_id]} is logged in!"
  else
    @error_message = "Login failed."
    erb(:login)
  end







# create new post
post '/finstagram_posts' do
  photo_url = params[:photo_url]
  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })
  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end
before '/finstagram_posts/new' do
  redirect to('/login') unless logged_in?
end
# form to create new post
get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end
# show a single post
get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])
  erb(:"finstagram_posts/show")
end 

end