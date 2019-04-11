require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  attr_reader :cheese

  def setup
    @cheese = Ingredient.new("Cheese", "C", 50)
  end

  def test_it_exists
    assert_instance_of Ingredient, cheese
  end
end
