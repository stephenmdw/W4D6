# PROBLEM 1

# Write a function, sumList, that takes in the head of a linked list containing numbers as an argument. The function should return the total sum of all values in the linked list.

class Node
   attr_accessor :val, :next_node

   def initialize(val, next_node = nil)
     @val = val
     @next_node = next_node
   end
 end

# test_00:
a = Node.new(2)
b = Node.new(8)
c = Node.new(3)
d = Node.new(-1)
e = Node.new(7)

a.next_node = b
b.next_node = c
c.next_node = d
d.next_node = e
#CREPE
#take in the head node, and find the next node 
#add the value of the head node to a sum that we set to 0
#move on to the next node with that sum 
#base case if the node.next_node is nil, then we return the value of the current node

#until node.next_node = nil 
#start with the sum being the head node
#keep adding node.next to the sum 

# def sum_list(node)
#     sum = node.val #2
#     current_node = node.next_node #b
#     until current_node == nil
#         sum += current_node.val  # 2 += 8 => 10, += 3 => 13 += -1 => 12 += 
#         current_node = current_node.next_node #c, d, e
#     end
#     sum
# end

# def sum_list(node)
#     return node.val if node.next_node == nil
#     sum = node.val
#     sum += sum_list(node.next_node)
# end

# // 2 -> 8 -> 3 -> -1 -> 7

# p sum_list(a) #// 19



# # test_01:
# x = Node.new(38)
# y = Node.new(4)

# x.next_node = y

# # // 38 -> 4

# sumList(x) #// 42

# # test_02:
# a = Node.new(100)

# a.next_node = 100

# # // 100

# sumList(a) #// 100

# # test_03:
# sumList(nil) #// 0

# PROBLEM 2

# Write a function, longestStreak, that takes in the head of a linked list as an argument. The function should return the length of the longest consecutive streak of the same value within the list.

# test_00:

a = Node.new(5)
b = Node.new(5)
c = Node.new(7)
d = Node.new(7)
e = Node.new(7)
f = Node.new(6)

a.next_node = b
b.next_node = c
c.next_node = d
d.next_node = e
e.next_node = f
    #take in the head, find the next node
    #make a counter
    # if the next node = last_node: count + 1 
    #if the next nodes val != the previous node's value then we get out of loop
    #return counter
def longest_streak(node)
    return 0 if node == nil
    longest = count_streak(node)
    while node.next_node != nil
        if longest < count_streak(node)
            longest = count_streak(node)
        end
        node = node.next_node
    end
    longest
end

def count_streak(node)
    count = 1
    current_node = node
    return count if current_node.next_node == nil 
    until current_node.next_node.val != current_node.val 
        count += 1
        current_node = current_node.next_node
    end
    count
end


#until value isnt equal to value.next we keep increasing count
#once it's not equal, we assign largest count to current, and reset current to 0
#


# // 5 -> 5 -> 7 -> 7 -> 7 -> 6

# p longest_streak(a) #// 3

# # # test_01:

# a = Node.new(4)

# # # // 4

# p longest_streak(a) #// 1

# # # test_02:

# p longest_streak(nil) #// 0

# # PROBLEM 2

# # Write a function, reverseList, that takes in the head of a linked list as an argument. The function should reverse the order of the nodes in the linked list in-place and return the new head of the reversed linked list.

# # HINT: you may consider using variables that point to the previous, current, and next node in the linked list.

# # test_00:

a = Node.new("a")
b = Node.new("b")
c = Node.new("c")
d = Node.new("d")
e = Node.new("e")
f = Node.new("f")

a.next_node = b
b.next_node = c
c.next_node = d
d.next_node = e
e.next_node = f
#until next_node == nil
#reassign next_node to be the previous node 

#A B C D E F 

def reverse_list(node)
    previous_node = node #A
    current_node = node.next_node #B
    next_node  = current_node.next_node #C
    
    until current_node == nil
        current_node.next_node = previous_node
        previous_node = current_node
        current_node = next_node
        if next_node != nil
            next_node = next_node.next_node
        end
    end
    previous_node
end

# # // a -> b -> c -> d -> e -> f

p reverse_list(a) #// f -> e -> d -> c -> b -> a

# # test_01:

# a = Node.new("a")
# b = Node.new("b")

# a.next_node = b

# # // a -> b 

# reverse_list(a) #// b -> a 

# # test_02:

# a = Node.new("a")

# # // a

# reverse_list(a) #// a 

# # Write a function, zipperLists, that takes in the head of two linked lists as arguments. The function should zipper the two lists together into single linked list by alternating nodes. If one of the linked lists is longer than the other, the resulting list should terminate with the remaining nodes. The function should return the head of the zippered linked list.

# # Do this in-place, by mutating the original Nodes.

# # You may assume that both input lists are non-empty.

# # PROBLEM 4

# # test_00:

# a = Node.new("a")
# b = Node.new("b")
# c = Node.new("c")

# a.next_node = b
# b.next_node = c

# # // a -> b -> c

# x = Node.new("x")
# y = Node.new("y")
# z = Node.new("z")

# x.next_node = y
# y.next_node = z

# #// x -> y -> z

# zipper_lists(a, x);
# #// a -> x -> b -> y -> c -> z

# # test_01:

# a = Node.new("a")
# b = Node.new("b")
# c = Node.new("c")
# d = Node.new("d")
# e = Node.new("e")
# f = Node.new("f")

# a.next_node = b
# b.next_node = c
# c.next_node = d
# d.next_node = e
# e.next_node = f

# # // a -> b -> c -> d -> e -> f

# x = Node.new("x")
# y = Node.new("y")
# z = Node.new("z")

# x.next_node = y
# y.next_node = z

# # // x -> y -> z

# zipper_lists(a, x);
# # // a -> x -> b -> y -> c -> z -> d -> e -> f