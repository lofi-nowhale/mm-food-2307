class SearchService
  def conn
    conn = Faraday.new("https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.foods[:key]
    end

  end 

  def get_url(link)
    # response = conn.get("/fdc/v1/foods/search?&query=#{food}")
    response = conn.get(link)

    json = JSON.parse(response.body, symbolize_names: true)

  end 
  
  def food_search(food)
    get_url("/fdc/v1/foods/search?&query=#{food}")[:foods]
  end

  def total_hits(food)
    get_url("/fdc/v1/foods/search?&query=#{food}")[:total_hits]
  end
end