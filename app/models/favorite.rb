class Favorite < ApplicationRecord
  validates_presence_of :country, :recipe_link, :recipe_title, :api_key

  belongs_to :user, foreign_key: 'api_key', primary_key: 'api_key'
end
