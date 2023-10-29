require 'rails_helper'

RSpec.describe "user search" do
  it 'allows user to search by ingredient' do
    all_foods = File.read("spec/fixtures/foods_list.json")
    
    # stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/list?.json").
    #   with(headers: {'X-API-Key' => "#{Rails.application.credentials.foods[:key]}"}).
    #   to_return(status: 200, body: all_foods)

    visit root_path

    fill_in :q, with: "sweet potatoes"
    click_button "Search"

    expect(page.status_code).to eq 200
  end
end