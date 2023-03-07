class Recipe

  attr_reader :title,
              :url,
              :image

  def initialize(data)
    @title    = data.dig(:recipe, :label)
    @url      = data.dig(:recipe, :url)
    @image    = data.dig(:recipe, :image)
  end
end
