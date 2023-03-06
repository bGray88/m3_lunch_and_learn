require 'rails_helper'

RSpec.describe 'Favorites' do
  before(:each) do
    @user1 = create(:user)
  end

  it 'can create favorite based on json favorite data' do
    payload = JSON.generate(
      favorite: {
        country: 'thailand',
        recipe_link: 'http://norecipes.com/recipe/chicken-paprikash/',
        recipe_title: 'Chicken Paprikash',
        api_key: @user1.api_key
      }
    )
    headers = {
      'CONTENT_TYPE': 'application/json',
      'ACCEPT': 'application/json'
    }

    post api_v1_favorites_path, headers: headers, params: payload

    call = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(call).to eq(success: "favorite has been successfully created")
  end

  it 'will return errors if post request unsuccessful' do
    payload = JSON.generate(
      favorite: {
        country: 'thailand',
        recipe_link: 'http://norecipes.com/recipe/chicken-paprikash/',
        recipe_title: 'Chicken Paprikash',
        api_key: "kshldfskhlshdlkfa"
      }
    )
    headers = {
      'CONTENT_TYPE': 'application/json',
      'ACCEPT': 'application/json'
    }

    post api_v1_favorites_path, headers: headers, params: payload

    call = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(call).to include(errors: [{ details: "unable to locate existing user" }])
  end
end
