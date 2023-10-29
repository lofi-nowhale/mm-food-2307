class FoodsFacade
  #call service make the data into objects 
  def initialize
    @search = SearchService.new
  end 

  def food_search(food)
    data = @search.food_search(food) #get an arry of food objects 

    data.map do |food_data|
      Food.new(food_data)
    end
  end
end