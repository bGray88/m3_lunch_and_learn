require 'rails_helper'

RSpec.describe 'Rest Country Facade' do
  it 'can return a random country' do
    country1 = RestCountryFacade.random_country
    country2 = RestCountryFacade.random_country

    expect(country1).to be_a(Country)
    expect(country1.name).to be_a(String)
    expect(country2).to_not eq(country1)
  end
end
