# frozen_string_literal: true

# represents a list node
class Node
  attr_accessor :value, :next_node, :previous_node

  def initialize
    @value = nil
    @next_node = nil
    @previous_node = nil
  end

  def to_s
    "( #{@value} )"
  end
end
