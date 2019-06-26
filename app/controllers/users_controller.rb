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
        flash[:warning] = "The username you have selected is already in use, please try another or login."
        redirect '/signup'
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
      flash[:success] = "You have successfully logged in."
      redirect to "/wines"
    else
      flash[:warning] = "Your username or password is incorrect"
      redirect to "/login"
    end
  end


  get '/logout' do
      session.clear
      flash[:success] = "You have successfully logged out."
      redirect to '/'
  end

end
