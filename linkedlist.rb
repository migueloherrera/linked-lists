################################################################

class Node

  attr_accessor :data, :next_node
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

end

################################################################

class LinkedList

  def initialize(data)
    @head = Node.new(data, nil)
    @tail = @head
  end
  
  def append(data)
    @tail.next_node = Node.new(data, nil)
    @tail = @tail.next_node
  end
  
  def prepend(data)
    node = Node.new(data, @head)
    @head = node
  end

  def size
    count = 1
    return count if @head == @tail
    node = @head
    while node.next_node != nil
      count += 1
      node = node.next_node
    end 
    count
  end
    
  def head
    @head
  end
  
  def tail
    @tail
  end
  
  def at(position)
    return @head if position == 0
    return nil if position > ((self.size) - 1)
    node = @head
    index = 0
    while node.next_node != nil
      index += 1
      node = node.next_node
      return node if index == position
    end 
  end
  
  def pop
    # there has to be always one element at least on the list
    if @head.next_node != nil
      node = @head
      while node.next_node.next_node != nil
        node = node.next_node
      end
      #puts "Node to be eliminated: #{node.next_node.data}"
      @tail = node
      @tail.next_node = nil
    else
      nil
    end
  end
  
  def contains?(data)
    return true if @head.data == data
    node = @head
    while node.next_node != nil
      node = node.next_node
      return true if node.data == data
    end 
    false
  end
  
  def find(data)
    return 0 if @head.data == data
    node = @head
    count = 0
    while node.next_node != nil
      node = node.next_node
      count += 1
      return count if node.data == data
    end 
    nil
  end
  
  def to_s
    return "#{@head.data} -> nil" if @head.next_node == nil
    r = ""
    node = @head
    while node.next_node != nil
      r += "( #{node.data} ) -> "
      node = node.next_node
    end 
    r += "( #{node.data} ) -> " + " nil"
  end
  
  def insert_at(position, data)
    if (position < 0) || (position > self.size - 1)
      puts "#{position} is out of range"
    elsif position == 0
      self.prepend(data) 
    elsif position == (self.size - 1)
      self.append(data)
    else
		  self.at(position-1).next_node = Node.new(data, self.at(position-1).next_node)
		end
	end
	
	def remove_at(position)
	  if (position < 0) || (position > self.size - 1)
      puts "#{position} is out of range"
    elsif position == 0
      @head = @head.next_node 
    elsif position == (self.size - 1)
      self.pop
    else
		  self.at(position-1).next_node = self.at(position).next_node
		end
  end

end
