require 'rails_helper'

RSpec.describe 'Tourist Sights Facade', :vcr do
  it 'will return formatted places depending upon latlng argument passed' do
    places = TouristSightFacade.search_sights("Gambia", 2)

    expect(places).to be_a(Array)
    expect(places.length).to eq(2)
    expect(places.first).to be_a(Place)
    expect(places.first.name).to be_a(String)
    expect(places.first.address).to be_a(String)
    expect(places.first.place_id).to be_a(String)
  end
end
