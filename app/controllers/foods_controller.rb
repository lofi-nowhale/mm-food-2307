class FoodsController < ApplicationController
  def index

    search_term = params[:q]

    conn = Faraday.new("https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.foods[:key]
    end

    response = conn.get("/fdc/v1/foods/search?api_key=#{Rails.application.credentials.foods[:key]}&query=#{search_term}.json")

    json = JSON.parse(response.body, symbolize_names: true)
    
    require 'pry';binding.pry


  end
end