class User < ApplicationRecord
  validates_presence_of :name, :email, :api_key
  validates :email, uniqueness: { case_sensitive: true }
  validates :api_key, uniqueness: { case_sensitive: true }

  has_many :favorites, foreign_key: 'api_key', primary_key: 'api_key', dependent: :destroy

  def self.random_key
    key = SecureRandom.hex(16)
    return SecureRandom.hex(16) if User.find_by(api_key: key)
    key
  end
end
