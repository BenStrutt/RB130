class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def self.at(hour, minute = 0)
    self.new(hour, minute)
  end
  
  def to_s
    sprintf("%02d:%02d", hour, minute)
  end
  
  def +(minutes)
    if minutes > 59
      self.hour += 1
      self.hour -= 24 if hour > 23
      minutes = minutes % 60
    end
    self.minute += minutes
    self
  end
  
  def -(minutes)
    if minutes > 59
      self.hour -= 1
      self.hour += 24 if hour < 0
      minutes = minutes % 60
    end
    self.minute -= minutes
    if minute < 0
      self.hour -= 1
      self.minute += 60
    end
    self
  end
  
  def ==(other)
    hour == other.hour && minute == other.minute
  end
  
  protected
  
  attr_reader :hour, :minute
  
  private
  
  attr_writer :hour, :minute
end

clock = Clock.at(10) + 3
p clock