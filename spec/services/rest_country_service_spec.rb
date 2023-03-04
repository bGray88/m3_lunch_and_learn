require 'rails_helper'

RSpec.describe 'Rest Country Service' do
  it 'can return values from API' do
    countries = RestCountryService.all_countries

    expect(countries).to be_a(Array)
    expect(countries.first).to have_key(:name)
    expect(countries.first).to be_a(Hash)
    expect(countries.dig(0, :name)).to have_key(:common)
    expect(countries.dig(0, :name, :common)).to be_a(String)
  end
end
