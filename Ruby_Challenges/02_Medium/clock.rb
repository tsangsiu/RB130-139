=begin

[P]
- Create a clock that is independent of date
- Add and subtract minutes from the time represented by a `Clock` object
- Do not mutate the `Clock` object
- Two `Clock` objects representing the same time are equal to each other
- Just use arithmetic operations

[E]
- From the given test cases,
  - we need to write a `Clock` class
  - the `Clock` class has a class method `at`
  - the class method `at` should somehow create a `Clock` object
  - `Clock` objects have a `to_s` method, which returns the time in 24-hour
    notation
  - `Clock` objects have `+` and `-` methods, which respectively add and
    subtract minutes from the time
  - `Clock` objects have a `==` method, which returns `true` if both `Clock`
    objects represent the same time

[D]
- Input: Integers (hours and minutes)
- Intermediate: Integers (hours and minutes)
- Output: String

[A]
- `Clock` class
  - Raise no error upon instantiation
  - No need to validate the arguments

- `Clock::at`
  - Accepts 1 or 2 integers as arguments
  - If 1 is given, that is the hour and the minute is default to be 0
  - If 2 are given, they are hour and minute
  - Store the hour and minute to instance variables
  - Return a `Clock` object

- `Clock#to_s`
  - Return the string representation of time based on the hour and minute
    tracked

- `Clock#==`
  - Return `true` if both the hour and minute are the same for both objects

- `Clock#+`
  - Add the number to the minute
  - If the minute < 0 or >= 60,
    - find the quotient and remainder when the minute is divided by 60
    - set the remainder to the minute
    - add the quotient to the hour
  - If the hour < 0 or >= 24,
    - find the remainder when the hour is divided by 24
    - set the remainder to the hour
  - Return a new `Clock` object based on the above hour and minute

- `Clock#-`
  - Make use of `Clock#+`

=end

class Clock
  attr_reader :hour, :minute

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def to_s
    hour_str = hour > 9 ? hour.to_s : "0#{hour}"
    minute_str = minute > 9 ? minute.to_s : "0#{minute}"
    "#{hour_str}:#{minute_str}"
  end

  def ==(clock)
    hour == clock.hour && minute == clock.minute
  end

  def +(minute_to_add)
    new_hour = hour
    new_minute = minute + minute_to_add
    if new_minute < 0 || new_minute >= MINUTES_PER_HOUR
      quotient, remainder = new_minute.divmod(MINUTES_PER_HOUR)
      new_hour += quotient
      new_minute = remainder
    end
    new_hour %= HOURS_PER_DAY if new_hour < 0 || new_hour >= HOURS_PER_DAY
    self.class.at(new_hour, new_minute)
  end

  def -(minute_to_subtract)
    self.+(-minute_to_subtract)
  end
end
