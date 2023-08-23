# Contains the logic for each node of the linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @next_node = nil
    @value = value
  end
end
