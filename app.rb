require 'sinatra'
require_relative 'config/application'
require "sinatra/reloader" if development?


set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetups/show/:id' do
  @meetup = Meetup.find(params[:id])
  @users = User.all
  #currently shows all users, not those joined
  erb :'meetups/show'
end

get '/meetups/new' do

  erb :'meetups/new'
end

post '/meetups/new' do
  if (session[:user_id])
    meetup = Meetup.new(name: params[:name], location: params[:location], description: params[:description], creator: User.find(session[:user_id]).username)
      if meetup.valid?
        meetup.save
        flash[:notice] = "Saved!"
        redirect '/'
      else
        flash[:notice] = "Not saved!"
      end
  else
    flash[:notice] = "You must sign in before creating an event!"
    erb :'meetups/new'
  end

post '/meetups/show/:id' do
  #needs to collect person joining and add to meetup users list 
  erb :'/meetups/show/:id'
end
end
