require 'rails_helper'

RSpec.describe 'User API' do
  before(:each) do
    @user1 = {
      name: Faker::Name.name,
      email: Faker::Internet.email
    }
    @user2 = {
      name: Faker::Name.name,
      email: Faker::Internet.email
    }
    @headers = {
      'CONTENT_TYPE': 'application/json',
      'ACCEPT': 'application/json'
    }
  end

  describe '#create' do
    it 'can create a user' do
      payload = JSON.generate(user: @user1)

      post api_v1_register_path, headers: @headers, params: payload

      user = JSON.parse(response.body, symbolize_names: true).dig(:data, :attributes)

      expect(response).to be_successful
      expect(User.find_by(@user1[:api_key])).to be_a(User)
      expect(user[:name]).to eq(@user1[:name])
      expect(user[:email]).to eq(@user1[:email])
      expect(user[:api_key]).to be_a(String)
      expect(user[:api_key].length).to eq(32)
    end

    it 'will not register user with same email' do
      payload = JSON.generate(user: @user1)

      post api_v1_register_path, headers: @headers, params: payload

      expect(response).to be_successful

      payload = JSON.generate(user: @user1)

      post api_v1_register_path, headers: @headers, params: payload

      expect(response).to_not be_successful
    end

    it 'has a unique api key for each user' do
      payload = JSON.generate(user: @user1)

      post api_v1_register_path, headers: @headers, params: payload

      user1_api = User.last.api_key

      payload = JSON.generate(user: @user2)

      post api_v1_register_path, headers: @headers, params: payload

      expect(User.last.api_key).to_not eq(user1_api)
    end
  end
end
