class User < ApplicationRecord
  validates_presence_of :name, :email, :api_key
  validates :email, uniqueness: { case_sensitive: true }
  validates :api_key, uniqueness: { case_sensitive: true }
end
