enable 'session'
require 'byebug'

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  @timenow = Time.now
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  user = User.where(name: params[:acct]).first
  unless user.nil?
    if user.password == params[:pw]
      session[:login] = params[:acct]
      redirect to('/')
      # if params[:id] == nil
      #   redirect to('/')
      # else
      #   redirect to("/post?=id#{params[:id]}")
    else
      redirect to('/login')
    end
  else
    User.create(name: params[:acct], password: params[:pw])
  end
end

get '/post' do
  @post = Post.find(params[:id])
  @timenow1 = Time.now
  erb :post
end

post '/comment' do
  user = User.where(name: session[:login]).first
  post = Post.find(params[:post].to_i)
  comment = Comment.create(title: params[:text])
  user.comments << comment
  post.comments << comment
  redirect to("/post?id=#{params[:post].to_i}")
end

get '/logout' do
session[:login] = nil
redirect '/'
end

get '/create' do
  erb :create
end

post '/create' do
  user = User.where(name: session[:login]).first
  post = Post.create(title: params[:title], link: params[:link])
  user.posts << post
  redirect to('/')
end

post '/upvotepost' do
  postvote1 = Postvote.create(like:1)
  post1 = Post.find(params[:upvotepost])
  user1 = User.where(name: session[:login]).first
  post1.postvotes << postvote1
  user1.postvotes << postvote1

  "ok".to_json
end