class FoodsController < ApplicationController
  def index
    @foods = FoodsFacade.new.food_search(params[:q]) 
    require 'pry';binding.pry#we want a list of data that we want
  end
end