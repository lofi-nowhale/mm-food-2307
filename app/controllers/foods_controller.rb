class FoodsController < ApplicationController
  def index
    search_term = params[:q]

    conn = Faraday.new("https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.foods[:key]
      faraday.params['query'] = search_term
      
    end
    response = conn.get("/fdc/v1/foods/search?&query=#{search_term}")
    require 'pry';binding.pry

    json = JSON.parse(response.body, symbolize_names: true)
    
    require 'pry';binding.pry


  end
end