require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do
    @user1 = {
      user: {
        name: Faker::Name.name,
        email: Faker::Internet.email
      }
    }
    @user2 = {
      user: {
        name: Faker::Name.name,
        email: Faker::Internet.email
      }
    }
  end

  it 'can create a user' do
    post api_v1_register_path(@user1)

    expect(response).to be_successful
    expect(User.last).to be_a(User)
    expect(User.last.name).to eq(@user1[:user][:name])
    expect(User.last.email).to eq(@user1[:user][:email])
    expect(User.last.api_key).to be_a(String)
    expect(User.last.api_key.length).to eq(32)
  end

  it 'will not register user with same email' do
    post api_v1_register_path(@user1)

    expect(response).to be_successful

    post api_v1_register_path(@user1)

    expect(response).to_not be_successful
  end

  it 'has a unique api key for each user' do
    post api_v1_register_path(@user1)

    user1_api = User.last.api_key

    post api_v1_register_path(@user2)

    expect(User.last.api_key).to_not eq(user1_api)
  end
end
