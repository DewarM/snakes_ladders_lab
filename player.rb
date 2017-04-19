class Player

  attr_reader :name
  attr_accessor :position

  def initialize(name, dice)
    @dice = dice
    @name = name
    @position = 0
  end

  def roll_dice
    return @dice.roll
  end

  def modify_position(value)
    return @position += value   
  end

end
