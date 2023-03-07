require 'rails_helper'

RSpec.describe 'Rest Country Facade' do
  it 'can return a random country', :vcr do
    country1 = RestCountryFacade.random_country
    country2 = RestCountryFacade.random_country

    expect(country1).to be_a(Country)
    expect(country1.name).to be_a(String)
    expect(country1.capital_latitude).to be_a(String)
    expect(country1.capital_longitude).to be_a(String)
  end

  it 'can return a specific country', :vcr do
    country1 = RestCountryFacade.specific_country("gambia")

    expect(country1).to be_a(Country)
    expect(country1.name).to be_a(String)
    expect(country1.name).to eq("Gambia")
    expect(country1.capital_latitude).to be_a(String)
    expect(country1.capital_longitude).to be_a(String)
  end
end
