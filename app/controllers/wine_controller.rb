class WineController < ApplicationController

  get '/wines' do
    erb :'wines/show'
  end


end
