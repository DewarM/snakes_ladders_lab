require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')
require_relative('../loaded_dice.rb')

class TestPlayer < MiniTest::Test

  def setup
    dice = LoadedDice.new(2)
    @player = Player.new("Mungo", dice)
  end

  def test_can_get_player_name_back
    assert_equal("Mungo", @player.name)
  end

  def test_can_get_player_position
    assert_equal(0, @player.position)
  end

  def test_can_set_player_position
    @player.position = 1
    assert_equal(1, @player.position)
  end

  def test_can_player_roll_dice
    dice = LoadedDice.new(3)
    player = Player.new("Irma", dice) 
    rolled_dice = player.roll_dice
    assert_equal(3, rolled_dice)
  end

  def test_can_player_roll_another_dice
    rolled_dice = @player.roll_dice
    assert_equal(2, rolled_dice)
  end

  def test_can_modify_position
    dice = LoadedDice.new(6)
    player = Player.new("Billy", dice)
    rolled_dice = player.roll_dice
    player.modify_position(rolled_dice)
    assert_equal(6, player.position) 
  end

  def test_can_modify_position_when_player_non_zero
    @player.position = 6
    rolled_dice = @player.roll_dice
    @player.modify_position(rolled_dice)
    assert_equal(8, @player.position)
  end

end














