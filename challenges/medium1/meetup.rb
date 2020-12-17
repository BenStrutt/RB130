require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, schedule)
    schedule.to_proc.call(self) { weekday }
  end
  
  def teenth
    find_date(13, 1) { yield }
  end
  
  def first
    find_date(1, 1) { yield }
  end
  
  def second
    find_date(8, 1) { yield }
  end
  
  def third
    find_date(15, 1) { yield }
  end
  
  def fourth
    find_date(22, 1) { yield }
  end
  
  def last
    find_date(-1, -1) { yield }
  end

  def find_date(start, i)
    date = Date.new(year, month, start)
    date = date + i until (yield.to_s + "?").to_sym.to_proc.call(date)
    date
  end
  
  attr_reader :month, :year
end