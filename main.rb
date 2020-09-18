require './lib/linked_list.rb'

$list = LinkedListModule::LinkedList.new

def puts_list_and_new_line
  puts "=> #{$list}"
  puts ''
end

puts 'Create new linked list'
puts $list
puts ''

puts 'Append 4'
puts "=> #{$list.append 4}"
puts ''

puts 'Append 5'
puts "=> #{$list.append 5}"
puts ''

puts 'Append 6'
puts "=> #{$list.append 6}"
puts ''

puts 'Prepend 3'
puts "=> #{$list.prepend 3}"
puts ''

puts 'Prepend 2'
puts "=> #{$list.prepend 2}"
puts ''

puts 'Prepend 1'
puts "=> #{$list.prepend 1}"
puts ''

puts "Current size: #{$list.size}"
puts "Current head's value: #{$list.head.value}"
puts "Current tail's value: #{$list.tail.value}"
puts "Current value at index 2: #{$list.at(2).value}"
puts ''

puts "Pop(remove) the last node: #{$list.pop.value}"
puts "=> #{$list}"
puts ''

puts "Contains 5?: #{$list.contains?(5)}"
puts "Contains 6?: #{$list.contains?(6)}"
puts "Index of value 1: #{$list.find(1)}"
puts "Index of value 5: #{$list.find(5)}"
puts ''

puts 'Insert 3.5 at index 3'
puts "=> #{$list.insert_at(3.5, 3)}"
puts ''

puts "Remove node at index 3: #{$list.remove_at(3).value}"
puts "=> #{$list}"
puts ''
