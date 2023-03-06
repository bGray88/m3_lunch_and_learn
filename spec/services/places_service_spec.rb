require 'rails_helper'

RSpec.describe 'Places Service' do
  it 'calls the service', :vcr do
    response = PlacesService.search(-87.770231, 41.878968, 5000)

    expect(response).to be_a(Hash)
  end
end
