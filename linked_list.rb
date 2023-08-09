# frozen_string_literal: true

require_relative 'node'

# represents the linked list
class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    if @head.nil?
      @head = node
    else
      cur_node = @head
      cur_node = cur_node.next_node until cur_node.next_node.nil?
      cur_node.next_node = node
      node.previous_node = cur_node
    end
    @tail = node
    @size += 1
  end

  def prepend(node)
    node.next_node = @head
    @head.previous_node = node
    @head = node
    @size += 1
  end

  def pop
    node = @tail
    previous_node = node.previous_node
    node.previous_node = nil
    previous_node.next_node = nil
    @tail = previous_node
    node
  end

  def at(index)
    return 'Invalid index' if index >= @size || index.negative?

    count = 0
    node = @head
    while count < index
      node = node.next_node
      count += 1
    end
    node
  end

  def contains?(value)
    return true if @head.value == value

    cur_node = @head
    until cur_node.next_node.nil?
      cur_node = cur_node.next_node
      break if cur_node.value == value
    end
    cur_node.value == value
  end

  def find_index(value)
    return 0 if @head.value == value

    cur_node = @head
    count = 0
    found = false
    until cur_node.next_node.nil?
      cur_node = cur_node.next_node
      count += 1
      found = true if cur_node.value == value
      break if cur_node.value == value
    end
    found ? count : 'Not found'
  end

  def to_s
    str = @head.to_s
    cur_node = @head
    until cur_node.next_node.nil?
      cur_node = cur_node.next_node
      str.concat(" -> #{cur_node}")
    end
    str
  end
end
