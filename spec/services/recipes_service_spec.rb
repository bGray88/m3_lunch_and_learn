require 'rails_helper'

RSpec.describe 'Recipes Service' do
  it 'calls the service', :vcr do
    recipes = RecipesService.search_by_name('thailand')

    expect(recipes).to be_a(Hash)
    expect(recipes).to have_key(:hits)
    expect(recipes[:hits]).to be_a(Array)

    recipe = recipes.dig(:hits, 0)

    expect(recipe).to be_a(Hash)
    expect(recipe).to have_key(:recipe)
    expect(recipe[:recipe]).to be_a(Hash)
    expect(recipe[:recipe]).to have_key(:label)
    expect(recipe.dig(:recipe, :label)).to be_a(String)
  end
end
