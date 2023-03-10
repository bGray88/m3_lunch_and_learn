require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe '#index' do
    it 'can get recipe based on search parameter passed', vcr: {record: :new_episodes}  do
      get api_v1_recipes_path(country: 'thailand')

      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)).to have_key(:data)
      expect(JSON.parse(response.body, symbolize_names: true).dig(:data, 0)).to have_key(:attributes)
      expect(JSON.parse(response.body, symbolize_names: true).dig(:data, 0, :attributes)).to have_key(:title)
      expect(JSON.parse(response.body, symbolize_names: true).dig(:data, 0, :attributes)).to_not have_key(:dietLabels)
      expect(JSON.parse(response.body, symbolize_names: true).dig(:data, 0, :attributes)).to_not have_key(:healthLabels)
    end

    it 'will return error json if search yields no results', :vcr do
      expect{
        get api_v1_recipes_path(country: 'hjgffyfj')
        JSON.parse(response.body, symbolize_names: true)
      }.to raise_error(SearchError) { |error| expect(error.details).to eq("invalid country") }
    end

    it 'will return empty data if search is empty string', :vcr do
      get api_v1_recipes_path(country: "")

      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(recipe).to eq({ data: [] })
    end

    it 'can get recipe with no search parameter passed', vcr: {record: :new_episodes} do
      get api_v1_recipes_path

      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(recipe).to have_key(:data)
      expect(recipe.dig(:data, 0)).to have_key(:attributes)
      expect(recipe.dig(:data, 0, :attributes)).to have_key(:title)
      expect(recipe.dig(:data, 0, :attributes)).to_not have_key(:dietLabels)
      expect(recipe.dig(:data, 0, :attributes)).to_not have_key(:healthLabels)
    end
  end
end
