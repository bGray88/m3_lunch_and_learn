class Country

  attr_reader :name

  def initialize(data)
    @name = data.dig(:name, :common)
  end
end
