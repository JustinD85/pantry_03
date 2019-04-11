class Recipe
  attr_reader :name

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    ingredient.quantity = quantity
    @ingredients << ingredient
  end

  def list_ingredients
    @ingredients.clone
  end

  def quantity_needed_for(ingredient)
    @ingredients.each { |ing| return ing.quantity if ing.name == ingredient }
    return 9999
  end

  def total_calories
    @ingredients.sum { |ingredient| ingredient.calories }
  end
end
