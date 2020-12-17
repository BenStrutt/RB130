class Game
  def initialize
    @frames = Array.new(9) { Frame.new } << TenthFrame.new
  end
  
  def roll(pins)
    if frames.all? { |frame| frame.completed? }
      raise StandardError, 'Should not be able to roll after game is over'
    end
    
    if pins < 0 || pins > 10
      raise StandardError, 'Pins must have a value from 0 to 10'
    end
    idx = 0
    loop do
      break if idx > 9
      break unless (frames[idx].completed? || frames[idx].waiting?)
      frames[idx] << pins if frames[idx].waiting?
      idx += 1
    end
    if idx > 9
      raise StandardError, 'Should not be able to roll after game is over'
    end
    frames[idx] << pins
  end
  
  def score
    unless frames.all? { |frame| frame.completed? }
      raise StandardError, 'Score cannot be taken until the end of the game'
    end
    score = 0
    frames.each do |frame|
      score += frame.score
    end
    score
  end
  
  private
  
  attr_reader :frames
end

class Frame
  def initialize
    @throws = []
    @additional_throws = []
  end
  
  def <<(pins)
    if throws.size == 1 && !strike? && throws[0] + pins > 10
      raise StandardError, 'Pin count exceeds pins on the lane'
    end
    (waiting? ? additional_throws : throws) << pins
  end
  
  def waiting?
    (strike? && additional_throws.size != 2) ||
    (spare? && additional_throws.size != 1)
  end
  
  def completed?
    (throws.size == 2 || strike?) && !waiting?
  end
  
  def score
    throws.sum + additional_throws.sum
  end
  
  private
  
  def strike?
    throws.first == 10
  end
  
  def spare?
    throws.size == 2 && throws.sum == 10
  end
  
  attr_reader :throws, :additional_throws
end

class TenthFrame < Frame
  def initialize
    super
  end
  
  def <<(pins)
    if throws.size == 1 && throws[0] < 10 && throws[0] + pins > 10
      raise StandardError, 'Pin count exceeds pins on the lane'
    end
    
    if throws.size == 2 && throws[1] < 10 && throws[1] + pins > 10
      raise StandardError, 'Pin count exceeds pins on the lane'
    end
    throws << pins
  end
  
  def waiting?
    false
  end
  
  def completed?
    throws.size == 3 || (throws.size == 2 && throws.sum < 10)
  end
  
  def score
    throws.sum
  end
end