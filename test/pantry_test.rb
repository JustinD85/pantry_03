require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test
  attr_reader :pantry, :cheese, :mac, :mac_and_cheese

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(cheese, 2)
    @mac_and_cheese.add_ingredient(mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, pantry
  end

  def test_its_stock_is_empty
    assert_equal Hash.new, pantry.stock
  end

  def test_it_has_empty_stock_of_ingredient
    assert_equal 0, pantry.stock_check(cheese)
  end

  def test_it_can_stock_ingredient
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    assert_equal 15, pantry.stock_check(cheese)
  end

  def test_it_can_return_check_if_pantry_has_enough_ingredients
    refute pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    refute pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(mac,8)
    assert true, pantry.enough_ingredients_for?(mac_and_cheese)
  end

end
