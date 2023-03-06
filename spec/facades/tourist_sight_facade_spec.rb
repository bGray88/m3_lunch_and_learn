require 'rails_helper'

RSpec.describe 'Tourist Sights Facade' do
  it 'will return formatted places depending upon latlng argument passed' do
    places = TouristSightFacade.search_sights(-104.950050, )
  end
end
