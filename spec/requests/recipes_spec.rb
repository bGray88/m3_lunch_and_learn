require 'rails_helper'

RSpec.describe 'Recipes' do
  it 'can get recipe based on name parameter passed', :vcr do
    get api_v1_recipes_path(search: 'thailand')

    expect(response).to be_successful
  end

  it 'will return empty data if search yields no results', :vcr do
    get api_v1_recipes_path(search: 'dhkfhlaksdhl')

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to eq({ data: [] })
  end

  it 'will return empty data if search is empty string', :vcr do
    get api_v1_recipes_path(search: "")

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to eq({ data: [] })
  end

  it 'can get recipe with no search parameter passed', :vcr do
    WebMock.allow_net_connect!
    VCR.eject_cassette
    VCR.turn_off!

    get api_v1_recipes_path

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to have_key(:data)
    expect(JSON.parse(response.body, symbolize_names: true)[:data]).to have_key(:attributes)
    expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes]).to have_key(:title)
    expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes]).to_not have_key(:dietLabels)
    expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes]).to_not have_key(:healthLabels)
    VCR.turn_on!
    WebMock.disable_net_connect!
  end
end
