module LinkedListModule
  class LinkedList
    attr_reader :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    def append(value)
      if @head.nil?
        @head = Node.new(value)
        @tail = @head
      else
        node = Node.new(value)
        @tail.next_node = node
        @tail = node
      end
      self
    end

    def prepend(value)
      if @head.nil?
        @head = Node.new(value)
        @tail = @head
      else
        node = Node.new(value, @head)
        @head = node
      end
      self
    end

    def size
      count = 0
      node = @head
      until node.nil?
        count += 1
        node = node.next_node
      end
      count
    end

    def at(index)
      index += size if index < 0

      if index < 0 || index >= size
        raise LinkedListError.new("index #{index} out of bounds")
      end

      current_index = 0
      node = @head
      until node.nil?
        return node if current_index == index
        current_index += 1
        node = node.next_node
      end
    end

    def pop
      if size <= 0
        return nil
      elsif size == 1
        node = @tail
        @head = nil
        @tail = nil
        return node
      end

      prev_tail = @tail
      @tail = at(-2)
      @tail.next_node = nil
      prev_tail
    end

    def contains?(value)
      node = @head
      until node.nil?
        return true if node.value == value
        node = node.next_node
      end
      false
    end

    def find(value)
      index = 0
      node = @head
      until node.nil?
        return index if node.value == value
        index += 1
        node = node.next_node
      end
      nil
    end

    def to_s
      str = ''
      node = @head
      until node.nil?
        str += "( #{node.value} ) -> "
        node = node.next_node
      end
      "#{str}nil"
    end

    def insert_at(value, index)
      if index == 0 || size == 0
        prepend(value)
      elsif index == -1 ||  index == size
        append(value)
      else
        if index > 0
          at(index - 1).next_node = Node.new(value, at(index))
        else
          at(index).next_node = Node.new(value, at(index + 1))
        end
      end
      self
    end

    def remove_at(index)
      if index == 0 || index == -(size)
        shift
      elsif index == size - 1 || index == -1
        pop
      else
        node = at(index)
        at(index - 1).next_node = at(index + 1)
        node
      end
    end

    private

    def shift
      if size <= 0
        return nil
      elsif size == 1
        node = @head
        @head = nil
        @tail = nil
        return node
      end

      prev_head = @head
      @head = @head.next_node
      prev_head
    end
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  class LinkedListError < StandardError
    def initialize(msg = '')
      super("error: #{msg}")
    end
  end
end
