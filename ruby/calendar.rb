require 'optparse'
require 'date'

class Calendar
  DEFAULT_DATE = Date.today
  WADY = %w[月 火 水 木 金 土 日].freeze

  def initialize(month = DEFAULT_DATE.month)
    @year = DEFAULT_DATE.year
    @month = month ? month.to_i : DEFAULT_DATE.month
  end

  def print_calendar
    if @month >= 1 && @month <= 12
      puts "#{@month}月 2023".center(20)

      puts WADY.join(' ')

      first_day = Date.new(@year, @month, 1)
      last_day = Date.new(@year, @month, -1)

      first_day_wday = first_day.wday.positive? ? first_day.wday - 1 : 6
      blank = '   ' * first_day_wday
      print blank

      print_date(last_day, first_day_wday)
    else
      puts "#{@month} is neither a month number (1..12) nor a name"
    end
  end

  private

  def print_date(last_day, first_day_wday)
    (1..last_day.day).each do |day|
      printf('%2d ', day)
      puts "\n" if ((first_day_wday + day) % 7).zero?
    end
    puts "\n"
  end
end

if ARGV.empty?
  calendar = Calendar.new
  calendar.print_calendar
else
  opt = OptionParser.new
  opt.on('-m [MONTH]') do |v|
    calendar = Calendar.new(v)
    calendar.print_calendar
  end
  opt.parse!(ARGV)
end
