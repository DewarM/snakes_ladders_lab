require('minitest/autorun')
require('minitest/rg')
require_relative('../loaded_dice.rb')

class TestLoadedDice < MiniTest::Test

  def test_can_create_dice
    dice = LoadedDice.new(4)
    refute_nil(dice)
  end

  def test_can_dice_give_value
    dice = LoadedDice.new(4)
    roll_dice = dice.roll
    assert_equal(4, roll_dice)
  end

  def test_can_get_back_loaded_val_correctly
    dice = LoadedDice.new(2)
    roll_dice = dice.roll
    assert_equal(2, roll_dice)
  end

end