=begin

[P]roblem
- Write a program which returns a date given a date description

[E]xample
- We need to write a `Meetup` class
  - Upon instantiation, it accepts two arguments: year and month
  - It has an instance method `day`
    - It returns a `Date` object based on a description (two strings)
    - The first string is the day of the week
    - The second string is: 'first', 'second', ..., 'last', 'teenth'
    - The strings are case-insensitive
    - If the described date does not exist, return `nil`

[D]ata Structure
- Input: Integers for year and month, String for description
- Output: a `Date` object

[A]lgorithm
- Constructor
  - It accepts two arguements: year and month
  - It raises no error
  - Save the year and month to instance variables

- `Meetup#day`
  - It accepts two arguments: day of the week and order
  - Given the day of the week
    - Find the first day in the month with the given day of the week
    - If the second argument is one of the: 'first', 'second', ..., 'fifth'
      - Then find the required 1st, 2nd, ... day in the month
    - Else if the second argument is 'last'
      - Find the last day in the month with the given day of the week
    - Else If the second argument is 'teenth'
      - Find the day that is in between 13 and 19, inclusively
  - Return a `Date` object with the date

=end

class Meetup
  DAY_OF_THE_WEEK = [
    'SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY'
  ]
  ORDER = ['FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH']
  NUMBER_OF_DAYS_IN_A_WEEK = 7

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, order)
    if ORDER.include?(order.upcase)
      day = first_day_given_month_and_weekday(weekday)
      day += NUMBER_OF_DAYS_IN_A_WEEK * (order_to_number(order) - 1)
    elsif order == 'last'
      day = last_day_given_month_and_weekday(weekday)
    elsif order == 'teenth'
      day = teenth_day_given_month_and_weekday(weekday)
    end
    Date.valid_date?(@year, @month, day) ? Date.new(@year, @month, day) : nil
  end

  private

  def first_day_given_month_and_weekday(weekday)
    1.upto(7) do |day|
      date = Date.civil(@year, @month, day)
      return day if date.wday == DAY_OF_THE_WEEK.index(weekday.upcase)
    end
  end

  def last_day_given_month_and_weekday(weekday)
    day = first_day_given_month_and_weekday(weekday)
    loop do
      break unless Date.valid_date?(@year, @month, day)
      day += 7
    end
    day - 7
  end

  def teenth_day_given_month_and_weekday(weekday)
    day = first_day_given_month_and_weekday(weekday)
    loop do
      break if (13..19).include?(day)
      day += 7
    end
    day
  end

  def order_to_number(order)
    ORDER.index(order.upcase) + 1
  end
end
