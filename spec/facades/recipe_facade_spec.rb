require 'rails_helper'

RSpec.describe 'Recipe Facade' do
  it 'can return recipes from a specific country', :vcr do
    recipes = RecipeFacade.recipes("gambia")

    expect(recipes).to have_key(:data)
    expect(recipes[:data]).to be_a(Array)
    expect(recipes[:data].first).to have_key(:attributes)
    expect(recipes[:data].first).to have_key(:type)
    expect(recipes[:data].first).to have_key(:id)
    expect(recipes.dig(:data, 0, :attributes)).to be_a(Hash)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:country)
    expect(recipes.dig(:data, 0, :attributes, :country)).to be_a(String)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:image)
    expect(recipes.dig(:data, 0, :attributes, :image)).to be_a(String)
  end

  it 'can return recipes from a random country if empty country params', vcr: {record: :new_episodes} do
    recipes = RecipeFacade.recipes(nil)

    expect(recipes[:data]).to be_a(Array)
    expect(recipes.dig(:data, 0)).to have_key(:id)
    expect(recipes.dig(:data, 0, :id)).to eq(nil)
    expect(recipes.dig(:data, 0)).to have_key(:type)
    expect(recipes.dig(:data, 0, :type)).to eq('recipe')
    expect(recipes.dig(:data, 0)).to have_key(:attributes)
    expect(recipes.dig(:data, 0, :attributes)).to be_a(Hash)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:title)
    expect(recipes.dig(:data, 0, :attributes, :title)).to be_a(String)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:url)
    expect(recipes.dig(:data, 0, :attributes, :url)).to be_a(String)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:country)
    expect(recipes.dig(:data, 0, :attributes, :country)).to be_a(String)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:image)
    expect(recipes.dig(:data, 0, :attributes, :image)).to be_a(String)
  end

  it 'can return error json if empty string passed in', :vcr do
    recipes = RecipeFacade.recipes("")

    expect(recipes).to eq({ data: [] })
  end

  it 'can return error json if invalid country name passed in', :vcr do
    expect{
      RecipeFacade.recipes("lhsldfiuahlsid")
    }.to raise_error(SearchError) { |error| expect(error.details).to eq("invalid country") }
  end
end
