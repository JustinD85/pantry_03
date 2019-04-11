
class Pantry

  def initialize
    @stock = {}
  end
  
  def stock
    @stock.clone
  end

  def stock_check(ingredient)
    @stock[ingredient] ? @stock[ingredient] : 0
  end

  def restock(ingredient, quantity)
    @stock[ingredient] = 0 unless @stock[ingredient]
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    return false if @stock.empty?
    @stock.all? { |ingredient, qty| qty >= recipe.quantity_needed_for(ingredient)}
  end

end
