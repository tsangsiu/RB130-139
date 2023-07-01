=begin

[P]
- Write a cumstom `Set` class
- For simplicity, assume that all elements of a set are numbers
- Sets contain no duplicate elements

[E]
- From the test cases, we need to write a `CustomSet` class

[D]
- Internally, we can use an `Array` to represent a set

[A]
- `CustomSet` class
  - Constructor
    - Optionally accepts an array as an argument
    - If no argument is passed, an empty set is created
    - Remove any duplicate elements
    - Sort the set, for easy manipulation

  - `CustomSet#empty?`
    - Return `true` if the set is empty

  - `CustomSet#contains?`
    - Accept an integer as an argument
    - Return `true` if the set contains that integer

  - `CustomSet#subset?`
    - Accept a `CustomSet` object as an argument
    - Return `true` if the set is a subset of the set passed in

  - `CustomSet#disjoint?`
    - Accept a `CustomSet` object as an argument
    - Return `true` if the both sets do not share the same element
    - If either or both sets are empty, they are disjoint

  - `CustomSet#eql?`
    - Accept a `CustomSet` object as an argument
    - Return `true` if both sets are equal,
      which means they have the same set of elements
    - Note that two empty sets are equal

  - `CustomSet#add`
    - Accept an integer as an argument
    - Add that integer to the set
    - Remove any duplicate elements

  - `CustomSet#intersection`
    - Accept a `CustomSet` object as an argument
    - Return a `CustomSet` object containing elements that both sets share

  - `CustomSet#difference`
    - Accept a `CustomSet` object as an argument
    - Return a `CustomSet` object containing elements that
      are not in the `CustomSet` object passed in

  - `CustomSet#union`
    - Accept a `CustomSet` object as an argument
    - Return a `CustomSet` object containing elements that both sets have

=end

class OriginalCustomSet
  def initialize(set = [])
    @set = set.uniq.sort
  end

  def empty?
    @set.empty?
  end

  def contains?(element)
    @set.include?(element)
  end

  def subset?(custom_set)
    @set.each do |element|
      return false unless custom_set.contains?(element)
    end
    true
  end

  def disjoint?(custom_set)
    return true if empty? || custom_set.set.empty?
    @set.none? do |element|
      custom_set.contains?(element)
    end
  end

  def ==(custom_set)
    @set == custom_set.set
  end

  def eql?(custom_set)
    self.==(custom_set)
  end

  def add(element)
    @set << element
    @set = @set.uniq.sort
    self
  end

  def intersection(custom_set)
    intersection = CustomSet.new
    @set.each do |element|
      intersection.add(element) if custom_set.contains?(element)
    end
    intersection
  end

  def difference(custom_set)
    difference = CustomSet.new
    @set.each do |element|
      difference.add(element) unless custom_set.contains?(element)
    end
    difference
  end

  def union(custom_set)
    union = CustomSet.new
    @set.each { |element| union.add(element) }
    custom_set.set.each { |element| union.add(element) }
    union
  end

  protected

  attr_reader :set
end

=begin

[D]
- This time, we use a Hash to internally represent a set,
  so as to increase the performance, especially for a large set

=end

class CustomSet
  def initialize(elements = Hash.new(false))
    if elements.class == Hash
      @set = elements
    else
      @set = Hash.new(false)
      elements.each { |element| @set[element] = true }
    end
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set[element]
  end

  def subset?(custom_set)
    set.keys.all? { |element| custom_set.contains?(element) }
  end

  def disjoint?(custom_set)
    set.keys.none? { |element| custom_set.contains?(element) }
  end

  def eql?(custom_set)
    set == custom_set.set
  end

  def ==(custom_set)
    eql?(custom_set)
  end

  def add(element)
    set[element] = true
    self
  end

  def intersection(custom_set)
    elements = set.select { |element| custom_set.contains?(element) }
    self.class.new(elements)
  end

  def difference(custom_set)
    elements = set.select { |element| !custom_set.contains?(element) }
    self.class.new(elements)
  end

  def union(custom_set)
    elements = set.merge(custom_set.set).keys
    self.class.new(elements)
  end

  protected

  attr_reader :set
end
