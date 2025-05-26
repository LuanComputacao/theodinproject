# frozen_string_literal: true

# Node Implementa
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

# Linked List Implementation
class LinkedList
  def initialize
    @head = nil
  end

  def display
    current = @head
    while current
      print "#{current.value} -> "
      current = current.next_node
    end
  end

  def add(node)
    new_node = node
    new_node.next_node = @head
    @head = new_node
  end

  def find(value)
    while current
      return current if current.value == value

      current = current.next_node
    end
  end

  def remove(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next_node
      return
    end

    current = @head
    current = current.next_node while current.next_node && current.next_node.value != value

    return unless current.next_node

    current.next_node = current.next_node.next_node
  end
end

linked_list = LinkedList.new
linked_list.add(Node.new(1))
linked_list.add(Node.new(4))
linked_list.add(Node.new(6))
linked_list.add(Node.new(8))
linked_list.display
linked_list.remove(8)
linked_list.remove(1)
puts "\nafter rmoving"
linked_list.display
