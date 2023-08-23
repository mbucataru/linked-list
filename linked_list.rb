require_relative 'node'

# Contains the logic for a linked list
class LinkedList
  attr_accessor :head_node

  def initialize
    @head_node = nil
  end

  def append(value)
    if head_node.nil?
      self.head_node = Node.new(value)
    else
      current_node = head_node
      current_node = current_node.next_node while current_node.next_node
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if head_node.nil?
      self.head_node = Node.new(value)
    else
      old_head_node = head_node
      @head_node = Node.new(value)
      head_node.next_node = old_head_node
    end
  end

  def size
    return 0 if head_node.nil?

    current_node = head_node
    size = 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      size += 1
    end
    size
  end

  def head
    return nil if head_node.nil?

    head_node
  end

  def tail
    return nil if head_node.nil?

    current_node = head_node
    loop do
      return current_node if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  def at(index)
    return nil if head_node.nil?

    current_node = head_node
    index.times do
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return nil if head_node.nil?
    return @head_node = nil if head_node.next_node.nil?

    current_node = head_node
    previous_node = nil
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
  end

  def contains?(value)
    return false if head_node.nil?

    current_node = head_node
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return nil if head_node.nil?

    current_node = head_node
    current_index = 0
    until current_node.nil?
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def to_s
    return nil if head_node.nil?

    current_node = head_node
    string_representation = ''
    until current_node.nil?
      string_representation += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    "#{string_representation}nil"
  end
end

linked_list = LinkedList.new
5.times do |num|
  linked_list.append(num + 1)
end
