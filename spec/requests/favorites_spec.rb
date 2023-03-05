require 'rails_helper'

RSpec.describe 'Favorites' do
  before(:each) do
    @user1 = {
      user: {
        name: Faker::Name.name,
        email: Faker::Internet.email
      }
    }
  end

  it 'can creat favorite based on json favorite data', :vcr do
    get api_v1_favorites_path

    expect(response).to be_successful
  end
end
