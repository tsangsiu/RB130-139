=begin

[P]
- To write a simple linked list implementation
- A linked list is a data structure
  - Each element in the list contains data and a "next" field pointing to the
    next element
- Write a method to reverse the linked list
- Write a method to convert a linked list to an array
- LIFO stack

[E]
- Refer to the test cases

[D]
- Intermediate
  - For easy implementation, we internally store a linked list as an array

[A]
- From the given test cases, we need to write a `SimpleLinkedList` class,
  and an `Element` class

- `Element` class
  - Constrcutor
    - Accepts two arguments: the datum and the next element
    - The next element should also be an `Element` object
    - The next element is optional
  - `Element#datum`
    - Return the datum
  - `Element#tail?`
    - Return `true` if there is no next element
  - `Element#next`
    - Return the next `Element` object

- `SimpleLinkedList` class
  - list << 1 << 2 << 3
    - [1, 2, 3]
    - 1 <- 2 <- 3
  - Constructor
    - Accepts no arguments
    - Create an empty array to store the linked list
  - `SimpleLinkedList#size`
    - Return the size of the array
  - `SimpleLinkedList#empty?`
    - Use `Array#empty?`
  - `SimpleLinkedList#push`
    - Accept one argument: the datum
    - Instantiate an `Element` object with that datum
    - Set that `Element` object's next element as the last element in the array
    - Push the `Element` object to the array
  - `SimpleLinkedList#head`
    - Return the first `Element` object in the linked list,
      which is the last element in the array
  - `SimpleLinkedList#peek`
    - Return the datum of the head
    - Return `nil` if the list is empty
  - `SimpleLinkedList#pop`
    - Remove the head of the linked list,
      which is the last `Element` object in the array
    - Return the datum of the popped element
  - `SimpleLinkedList#pop`
    - Remove the last `Element` object in the array
    - Set the last `Element` object's next element as `nil`
    - Return the datum of the popped element
  - `SimpleLinkedList::from_a`
    - To transform an array to a linked list
    - Accepts an array or a `nil` object as an argument
    - If the passed argument is `nil`,
      - Create an empty linked list
      - Return the linked list
    - Else,
      - Reverse the passed array
      - Traverse each element in the passed array
      - Use `push` method to create the linked list
      - Return the linked list
  - `SimpleLinkedList#to_a`
    - Get the internal representation of the linked list
    - Reverse it
    - Transform each `Element` object to its datum
    - Return the transformed array
  - `SimpleLinkedList#reverse`
    - Get the internal representation of the linked list
    - Reverse it
    - Transform each `Element` object to its datum
    - Use `push` method to create the new linked list
    - Return the linked list

=end

class SimpleLinkedList
  def initialize
    @linked_list = []
  end

  def size
    @linked_list.size
  end

  def empty?
    @linked_list.empty?
  end

  def push(datum)
    element = Element.new(datum)
    element.next = @linked_list.last unless empty?
    @linked_list << element
    @linked_list.clone
  end

  def head
    @linked_list.last.clone
  end

  def peek
    return head.datum unless head.nil?
    nil
  end

  def pop
    @linked_list.pop.datum
  end

  def self.from_a(array)
    return new if array.nil?
    linked_list = new
    array.reverse.each { |datum| linked_list.push(datum) }
    linked_list
  end

  def to_a
    @linked_list.reverse.map(&:datum)
  end

  def reverse
    reverse_linked_list = self.class.new
    to_a.each { |element| reverse_linked_list.push(element) }
    reverse_linked_list
  end
end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next_element.nil?
  end
end
