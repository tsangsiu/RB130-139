=begin

[P]
- Given an object that represents a meetup date (year and month),
  - Return a `Date` object representing the exact date based on a descriptor
- The descriptotrs could be:
  - 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
  - 'Monday', 'Tuesday', ..., 'Sunday'
  - case-insensitive

[E]
- From the given test cases,
  - we need to write a `Meetup` class
- `Meetup` class
  - Accepts two Integers representing year and month upon instantiation
  - Raise no error when instantiation
- `Meetup#day`
  - Accepts two String arguments
  - The first one is the day of the week (case-insensitive)
  - The second one is the descriptor (case-insensitive)
- Examples
  - Meetup.new(2013, 3).day('Monday', 'first')
    => The first Monday in March 2013
    => Date.civil(2013, 3, 4)
  - Meetup.new(2015, 12).day('Friday', 'fifth')
    => The fifth Friday in December 2015
    => nil
  - Meetup.new(2016, 5).day('Wednesday', 'last')
    => The last Wednesday in May 2016
    => Date.civil(2016, 5, 25)
  - Meetup.new(2017, 1).day('Thursday', 'teenth')
    => The 'teenth' day on Thursday
    => Date.civil(2017, 1, 19)

[D]
- Instantiation
  - Input: Two Integers representing year and month
- `Meetup#day`
  - Input: Two Strings representing day of the week and a schedule
  - Output: A `Date` object

[A]
- Instantiation
  - Accepts two integers as arguments
  - They represent year and month
  - No argument check

- `Meetup#day`
  - Accepts two strings: weekday and schedule as arguments
  - Convert the given weekday to integer:
    - 'Sunday' -> 0, 'Monday' -> 1, ..., 'Saturday' -> 6

  - If the given schedule is one of the 'first', 'second', ..., 'fifth',
    - Find the first date of the month with the desired weekday
    - Find the day of the n-th desired weekday
    - If the date is valid, return it.
    - Else return `nil`

  - If the given schedule is `last`,
    - Initialize `last_valid_date` to `nil`
    - Find the first date of the month with the desired weekday
    - Until the date is invalid,
      - Add 7 to the date
      - Assign the result date to `last_valid_date`
    - Return `last_valid_date`

  - If the given schedule is `teenth`,
    - Find the first date of the month with the desired weekday
    - Add 7 to the date until the day is a `teenth`
    - Return the `teenth` date

=end

require 'date'

class Meetup
  WEEK_DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday',
               'Thursday', 'Friday', 'Saturday']
  ORDINAL_NUMBERS = [nil, 'first', 'second', 'third', 'fourth', 'fifth']

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(wday, sched)
    if ORDINAL_NUMBERS.include?(sched.downcase)
      find_date_when_sched_is_ordinal_number(wday, sched)
    elsif sched.downcase == 'last'
      find_date_when_sched_is_last(wday)
    elsif sched.downcase == 'teenth'
      find_date_when_sched_is_teenth(wday)
    end
  end

  private

  def to_wday_num(wday_char)
    WEEK_DAYS.index(wday_char.capitalize)
  end

  def to_ordinal_num(ordinal_char)
    ORDINAL_NUMBERS.index(ordinal_char.downcase)
  end

  def find_first_date_with_wday(wday)
    wday = to_wday_num(wday.capitalize) if wday.class == String
    date = Date.civil(@year, @month, 1)
    until date.wday == wday
      date += 1
    end
    date
  end

  def find_date_when_sched_is_ordinal_number(wday, ordinal)
    first_date = find_first_date_with_wday(wday)
    ordinal = to_ordinal_num(ordinal) if ordinal.class == String
    day = first_date.day + 7 * (ordinal - 1)
    return nil unless Date.valid_date?(@year, @month, day)
    Date.civil(@year, @month, day)
  end

  def find_date_when_sched_is_last(wday)
    first_date = find_first_date_with_wday(wday)
    day = first_date.day
    last_valid_date = nil
    until !Date.valid_date?(@year, @month, day)
      last_valid_date = Date.civil(@year, @month, day)
      day += 7
    end
    last_valid_date
  end

  def find_date_when_sched_is_teenth(wday)
    first_date = find_first_date_with_wday(wday)
    day = first_date.day
    until (13..19).include?(day)
      day += 7
    end
    Date.civil(@year, @month, day)
  end
end
