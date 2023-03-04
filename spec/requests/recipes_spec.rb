require 'rails_helper'

RSpec.describe 'Recipes' do
  it 'can get recipe based on name parameter passed' do
    get api_v1_recipes_path(search: 'thailand')

    expect(response).to be_successful
  end

  it 'will return empty data if search yields no results' do
    get api_v1_recipes_path(search: 'dhkfhlaksdhl')

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to eq({ data: [] })
  end

  it 'can get recipe with no search parameter passed' do
    get api_v1_recipes_path

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to have_key(:data)
    expect(JSON.parse(response.body, symbolize_names: true)[:data]).to have_key(:attributes)
    expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes]).to have_key(:title)
  end
end
