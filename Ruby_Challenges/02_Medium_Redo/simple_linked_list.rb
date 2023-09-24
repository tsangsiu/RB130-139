=begin

[P]roblem
- Write a program to implement a simple linked list
- LIFO stack; Last In, First Out

[E]xample

[D]ata Structure

[A]lgorithm

=end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @simple_linked_list = []
  end

  def self.from_a(array)
    return new if array.nil?
    simple_linked_list = new
    array.reverse.each do |element|
      simple_linked_list.push(element)
    end
    simple_linked_list
  end

  def size
    @simple_linked_list.size
  end

  def empty?
    @simple_linked_list.empty?
  end

  def push(datum)
    new_element = Element.new(datum)
    new_element.next = head unless head.nil?
    @simple_linked_list << new_element
  end

  def peek
    return nil if empty?
    @simple_linked_list.last.datum
  end

  def head
    @simple_linked_list.last
  end

  def pop
    @simple_linked_list.pop.datum
  end

  def to_a
    @simple_linked_list.reverse.map(&:datum)
  end

  def reverse
    simple_linked_list = self.class.new
    @simple_linked_list.reverse.each do |element|
      simple_linked_list.push(element.datum)
    end
    simple_linked_list
  end
end
