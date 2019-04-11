class Ingredient
  attr_accessor :quantity, :name, :unit, :calories

  def initialize(name, unit, calories)
    @name = name
    @unit = unit
    @calories = calories
    @quantity = 0
  end
end
