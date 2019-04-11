require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  attr_reader :mac_and_cheese, :cheese, :hot_sauce

  def setup
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @cheese = Ingredient.new("Cheese", "C", 50)
    @hot_sauce = Ingredient.new("Hot Sauce", "C", 20)
  end

  def test_it_exists
    assert_instance_of Recipe, mac_and_cheese
  end

  def test_it_can_add_ingredients
    assert_equal Array.new, mac_and_cheese.list_ingredients
  end

  def test_it_can_add_ingredients
    mac_and_cheese.add_ingredient(cheese, 3)
    mac_and_cheese.add_ingredient(hot_sauce, 4)
    expected = [cheese,hot_sauce]
    assert_equal expected, mac_and_cheese.list_ingredients
  end

  def test_it_can_check_quantity_of_ingredient_for_recipe
    mac_and_cheese.add_ingredient(cheese, 3)
    mac_and_cheese.add_ingredient(hot_sauce, 4)
    assert_equal 3, mac_and_cheese.quantity_needed_for("Cheese")
    assert_equal 4, mac_and_cheese.quantity_needed_for("Hot Sauce")
  end

  def test_it_can_return_calories_of_dish
    mac_and_cheese.add_ingredient(cheese, 3)
    mac_and_cheese.add_ingredient(hot_sauce, 4)
    assert_equal 70, mac_and_cheese.total_calories
  end
  
end
