class Game

  attr_reader :won

  def initialize(winning_position, players, portal_hash)
    @players = players
    @portal_hash = portal_hash
    @winning_position = winning_position
    @won = false
  end

  def next_player
    selected_player = @players.shift 
    @players << selected_player
    return selected_player
  end

  def check_position_portal_hash(player)
    portal = @portal_hash[player.position] 
    if portal == nil
      return player.position
    else 
      portal_length = portal.length
      player.modify_position(portal_length)
    end
  end

  def check_winning_position(player)
    @won = true if player.position >= @winning_position
    return player.position >= @winning_position
  end

  def step
    player = next_player()
    roll_amount = player.roll_dice
    player.modify_position(roll_amount)
    check_winning_position(player)
    check_position_portal_hash(player)

  end

end

