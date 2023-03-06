require 'rails_helper'

RSpec.describe User, type: :model do
  describe User, 'validations' do
    subject { create(:user) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:api_key) }
    it { should validate_presence_of(:api_key) }

    it { should have_many(:favorites)}
  end

  describe User, 'instance methods' do
    describe '#random_key' do
      it 'will return a random 32 alphanumeric string' do
        key1 = User.random_key
        key2 = User.random_key
        key3 = User.random_key

        expect(key1.length).to eq(32)
        expect(key1).to_not eq(key2)
        expect(key2).to_not eq(key3)
        expect(key3).to_not eq(key1)
      end
    end
  end
end
