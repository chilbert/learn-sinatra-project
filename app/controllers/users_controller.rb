require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end


  post "/users/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      user = User.find_by(username: params[:username])
      if user
        redirect '/login'
      else
      user = User.create(username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
      session[:user_id] = user.id
      redirect '/wines'
    end
    end
  end

  get '/login' do
    erb :'/users/login'
  end


  post "/users/login" do
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/wines"
    else
      redirect to "/login"
    end
  end


  get '/logout' do
      session.clear
      redirect to '/'
  end

end
