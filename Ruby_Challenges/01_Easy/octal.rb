class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    decimal = 0
    return decimal if @octal =~ /[^0-7]/
    digits = @octal.split('').reverse
    digits.each_with_index do |digit, index|
      decimal += digit.to_i * 8 ** index
    end
    decimal
  end
end
