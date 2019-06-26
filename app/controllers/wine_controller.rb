require 'pry'
class WineController < ApplicationController

  get '/wines' do
    if logged_in?
      @wines = []
      @bottle_count = []
      @all_wine = Wine.all
      @all_wine.each do |wine|
        if wine.user_id == current_user.id
        @wines << wine
        @bottle_count << wine.bottle_count
      end
    end
      erb :'/wines/show'
    else
      flash[:warning] = "Please login to view your wines."
      redirect to '/login'
    end
  end

  post '/wines' do
    if logged_in?
        @wine = Wine.create(:wine_name => params[:wine_name], :wine_variety => params[:wine_variety], :wine_vintage => params[:wine_vintage], :bottle_count => params[:bottle_count])
        @wine.user_id = current_user.id
        @wine.save
        redirect to "/wines"
    else
      redirect to '/users/login'
    end
  end

  get '/wines/new' do
    if logged_in?
    erb :'wines/new'
    else
    flash[:warning] = "Please login to add your wines."
    redirect to '/login'
    end
  end

  get '/wines/edit/:id' do
    if logged_in?
      @wine = Wine.find_by_id(params[:id])
      erb :'wines/edit'
    else
      flash[:warning] = "Please login to update your wines."
      redirect to '/login'
    end
  end

  patch '/wines/:id' do 
      if logged_in?
          @wine = Wine.find_by_id(params[:id])
          @wine.update(wine_name: params[:wine_name], wine_variety: params[:wine_variety], wine_vintage: params[:wine_vintage], bottle_count: params[:bottle_count])
          flash[:success] = "Your wine was updated"
          redirect to "/wines"
      else
        redirect to '/users/login'
      end
    end




end
