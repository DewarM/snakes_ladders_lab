require('minitest/autorun')
require('minitest/rg')
require_relative('../game.rb')
require_relative('../loaded_dice.rb')
require_relative('../player.rb')
require_relative('../portal.rb')

class TestGame < MiniTest::Test

  def setup 
    portal3 = Portal.new(48)
    portal6 = Portal.new(21)
    portal25 = Portal.new(-20)
    portal34 = Portal.new(-33)
    portal_hash = {3 => portal3, 6 => portal6, 25 => portal25, 34 => portal34}

    dice = LoadedDice.new(2)

    @player1 = Player.new("Mungo", dice)
    @player2 = Player.new("Irma", dice)
    players = [@player1, @player2]

    @game = Game.new(100, players, portal_hash)
  end

  def test_can_call_next_player
    next_player_return = @game.next_player()
    assert_equal(@player1, next_player_return)
  end

  def test_can_call_next_player_again
    @game.next_player()
    next_player_return = @game.next_player()
    assert_equal(@player2, next_player_return)
  end

  def test_can_check_position_on_portal_hash__when_player_at_starting_position
    actual = @game.check_position_portal_hash(@player1)
    assert_equal(0, actual)
  end

  def test_can_check_position_on_portal_hash__when_player_at_position_four
    @player1.position = 4
    actual = @game.check_position_portal_hash(@player1)
    assert_equal(4, actual)
  end

  def test_can_check_position_on_portal_hash
    @player1.position = 3
    actual = @game.check_position_portal_hash(@player1)
    assert_equal(51, actual)
  end

  def test_can_check_position_on_portal_hash_number_twenty_five
    @player1.position = 25
    actual = @game.check_position_portal_hash(@player1)
    assert_equal(5, actual)
  end

  def test_can_check_position_is_winning_position
    actual = @game.check_winning_position(@player1)
    assert_equal(false, actual)
  end

  def test_can_check_position_is_winning_position__return_true_when_player_has_won
    @player1.position = 100
    actual = @game.check_winning_position(@player1)
    assert_equal(true, actual)     
  end

  def test_can_check_position_is_winning_position__return_true_when_player_position_higher_than_win_position
    @player1.position = 105
    actual = @game.check_winning_position(@player1)
    assert_equal(true, actual)     
  end

  def test_step_moves_first_player_correctly
    @game.step
    assert_equal(2, @player1.position)
  end

  def test_step_moves_player_correctly_when_landing_on_portal
    @player1.position = 1
    @game.step
    assert_equal(51, @player1.position)
  end

  def test_step_checks_correctly_for_a_win
    @player1.position = 98
    @game.step
    assert_equal(true, @game.won)
  end

  def test_step_checks_correctly_for_a_win__no_players_yet_won
    @player1.position = 7
    @game.step
    assert_equal(false, @game.won)
  end


  


  
end