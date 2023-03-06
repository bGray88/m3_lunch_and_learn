require 'rails_helper'

RSpec.describe 'Favorites' do
  before(:each) do
    @user1 = create(:user)

    @headers = {
      'CONTENT_TYPE': 'application/json',
      'ACCEPT': 'application/json'
    }
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

    post api_v1_favorites_path, headers: @headers, params: payload

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

    post api_v1_favorites_path, headers: @headers, params: payload

    call = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(call).to include(errors: [{ details: "unable to locate existing user" }])
  end

  it 'will return a list of a user\'s favorites' do
    create(:favorite, user: @user1)
    create(:favorite, user: @user1)

    get api_v1_favorites_path(api_key: @user1.api_key), headers: @headers

    call = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(call.length).to eq(2)
    expect(call).to be_a(Hash)
    expect(call).to have_key(:data)
    expect(call[:data]).to be_a(Array)
    expect(call.dig(:data, 0)).to be_a(Hash)
    expect(call.dig(:data, 0)).to have_key(:attributes)
    expect(call.dig(:data, 0, :attributes)).to be_a(Hash)
    expect(call.dig(:data, 0)).to have_key(:id)
    expect(call.dig(:data, 0, :id)).to be_a(Integer)
    expect(call.dig(:data, 0)).to have_key(:type)
    expect(call.dig(:data, 0, :type)).to be_a(String)
  end

  it 'will return an empty array if nothing favorited yet' do
    get api_v1_favorites_path(api_key: @user1.api_key), headers: @headers

    call = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(call).to eq({ data: [] })
  end
end
