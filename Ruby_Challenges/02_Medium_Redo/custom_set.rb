=begin

[P]roblem
- Write a program to implement a custom set type (data structure)

[E]xample

[D]ata Structure

[A]lgorithm

=end

class CustomSet
  def initialize(set = [])
    @set = set.uniq
  end

  def empty?
    @set.empty?
  end

  def contains?(element)
    @set.include?(element)
  end

  def subset?(custom_set)
    @set.all? { |element| custom_set.set.include?(element) }
  end

  def disjoint?(custom_set)
    @set.none? { |element| custom_set.set.include?(element) }
  end

  def add(element)
    @set << element
    @set.uniq!
    self.class.new(@set)
  end

  def eql?(custom_set)
    self.==(custom_set)
  end

  def ==(custom_set)
    @set.sort == custom_set.set.sort
  end

  def intersection(custom_set)
    intersection = []
    @set.each do |element|
      intersection << element if custom_set.set.include?(element)
    end
    self.class.new(intersection)
  end

  def difference(custom_set)
    difference = []
    @set.each do |element|
      difference << element unless custom_set.set.include?(element)
    end
    self.class.new(difference)
  end

  def union(custom_set)
    union = @set + custom_set.set
    self.class.new(union.uniq)
  end

  protected

  attr_reader :set
end
