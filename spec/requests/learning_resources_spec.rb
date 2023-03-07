require 'rails_helper'

RSpec.describe 'Learning Resources API' do
  describe '#index' do
    it 'can get resource based on country parameter passed', :vcr do
      get api_v1_learning_resources_path(country: 'kuwait')

      resource = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(resource).to be_a(Hash)
      expect(resource).to have_key(:data)
      expect(resource[:data]).to have_key(:id)
      expect(resource.dig(:data, :id)).to eq(nil)
      expect(resource[:data]).to have_key(:type)
      expect(resource.dig(:data, :type)).to eq('learning_resource')
      expect(resource[:data]).to have_key(:attributes)
      expect(resource.dig(:data, :attributes)).to be_a(Hash)
      expect(resource.dig(:data, :attributes)).to have_key(:video)
      expect(resource.dig(:data, :attributes, :video)).to be_a(Hash)
      expect(resource.dig(:data, :attributes)).to have_key(:images)
      expect(resource.dig(:data, :attributes, :images)).to be_a(Array)
      expect(resource.dig(:data, :attributes, :images).first).to be_a(Hash)
      expect(resource.dig(:data, :attributes, :images).first).to have_key(:alt_tag)
      expect(resource.dig(:data, :attributes, :images).first[:alt_tag]).to be_a(String)
      expect(resource.dig(:data, :attributes, :images).first[:url]).to be_a(String)
    end

    it 'will return empty json based on empty string parameter passed', :vcr do
      get api_v1_learning_resources_path(country: '')

      resource = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(resource).to be_a(Hash)
      expect(resource).to have_key(:data)
      expect(resource[:data]).to have_key(:id)
      expect(resource.dig(:data, :id)).to eq(nil)
      expect(resource[:data]).to have_key(:type)
      expect(resource.dig(:data, :type)).to eq('learning_resource')
      expect(resource[:data]).to have_key(:attributes)
      expect(resource.dig(:data, :attributes)).to be_a(Hash)
      expect(resource.dig(:data, :attributes)).to have_key(:video)
      expect(resource.dig(:data, :attributes, :video)).to be_a(Hash)
      expect(resource.dig(:data, :attributes, :video).length).to eq(0)
      expect(resource.dig(:data, :attributes, :video)).to_not have_key(:title)
      expect(resource.dig(:data, :attributes, :video)).to_not have_key(:youtube_video_id)
      expect(resource.dig(:data, :attributes)).to have_key(:images)
      expect(resource.dig(:data, :attributes, :images)).to be_a(Array)
      expect(resource.dig(:data, :attributes, :images).length).to eq(0)
    end

    it 'can get resource based on country parameter passed', :vcr do
      get api_v1_learning_resources_path(country: nil)

      resource = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(resource).to be_a(Hash)
      expect(resource).to have_key(:data)
      expect(resource[:data]).to have_key(:id)
      expect(resource.dig(:data, :id)).to eq(nil)
      expect(resource[:data]).to have_key(:type)
      expect(resource.dig(:data, :type)).to eq('learning_resource')
      expect(resource[:data]).to have_key(:attributes)
      expect(resource.dig(:data, :attributes)).to be_a(Hash)
      expect(resource.dig(:data, :attributes)).to have_key(:video)
      expect(resource.dig(:data, :attributes, :video)).to be_a(Hash)
      expect(resource.dig(:data, :attributes, :video).length).to eq(0)
      expect(resource.dig(:data, :attributes, :video)).to_not have_key(:title)
      expect(resource.dig(:data, :attributes, :video)).to_not have_key(:youtube_video_id)
      expect(resource.dig(:data, :attributes)).to have_key(:images)
      expect(resource.dig(:data, :attributes, :images)).to be_a(Array)
      expect(resource.dig(:data, :attributes, :images).length).to eq(0)
    end
  end
end
