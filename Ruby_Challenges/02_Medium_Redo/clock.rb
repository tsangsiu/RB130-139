=begin

[P]roblem
- To program a clock that is independent of date
- Able to add minutes to and subtract minutes from the time

[E]xample
- We need to write a `Clock` class
- **When adding and subtracting minutes, create a new `Clock` object
- Two `Clock` objects representing the same time are equal to each other
- We use 24-hour clock

[D]ata Structure
- We will use Integers to represent hour and minute

[A]lgorithm
- `Clock` class
  - `::at`
    - It accepts one or two Integer arguments: `hour` and `minute`
    - If only one is given, it is assigned to `hour` and
        `minute` is set to be `0`
    - It instantiate a `Clock` object
    - Return that object

  - Constructor
    - Save the `hour` and `minute` to respective instance variable

  - `to_s`
    - Take the instance variables that represent hour and minute
    - Format them in the format "HH:MM"
    - Return that String

  - `+`
    - It takes an Integer as an argument
    - Add that to minute
    - Get the quotient and remainder when the new minute is modulus by 60
    - Assign the remainder to be the new minute
    - Assign the quotient to hour to get the new hour
    - Get the quotient when the new hour is modulus by 24
    - Assign the remainder to be the new hour
    - Return a new `Clock` object with the new hour and minute

  - `-`
    - Make use of `+`

  - `==`
    - Return `true` if `hour` and `minutes` are the same
        for both `Clock` objects

=end

class Clock
  attr_reader :hour, :minute

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    hour_s = @hour < 10 ? "0#{@hour}" : @hour.to_s
    minute_s = @minute < 10 ? "0#{@minute}" : @minute.to_s
    "#{hour_s}:#{minute_s}"
  end

  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end

  def +(minute)
    new_minute = @minute + minute
    new_hour = (@hour + (new_minute / 60)) % 24
    new_minute %= 60
    self.class.new(new_hour, new_minute)
  end

  def -(minute)
    self.+(-minute)
  end
end
