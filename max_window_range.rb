require 'byebug'

def niave_max_widow(arr, w)
  i = 0
  cur_largest_max = 0

  while i + w <= arr.length
    test_widow = arr[i...i+w]
    test_diff = test_widow.max - test_widow.min
    cur_largest_max = test_diff if cur_largest_max < test_diff
     i += 1
  end

  cur_largest_max
end



class MyQueue
  def initialize
    @store = []
  end

  def enqueue(item)
    @store.push(item)
  end

  def dequeue
    @store.shift
  end

  def size
    @store.length
  end

  def peek
    @store.dup
  end

  def empty?
    @store.empty?
  end

end

class MyStack
  def initialize
    @store = []

  end

  def pop
    @store.pop
  end

  def push(item)
    @store.push(item)
  end

  def size
    @store.length
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @store_dequeue = MyStack.new
    @store_enqueue = MyStack.new

  end

  def max
    dq_peek_info = @store_dequeue.peek
    eq_peek_info = @store_enqueue.peek

    if dq_peek_info.nil?
     #  debugger
      eq_peek_info[:max_val]
    elsif eq_peek_info.nil?
      dq_peek_info[:max_val]
    else
      dqmax = dq_peek_info[:max_val]
      nqmax = eq_peek_info[:max_val]
      dqmax > nqmax ? dqmax : nqmax
    end
  end


   def min
     dq_peek_info = @store_dequeue.peek
     eq_peek_info = @store_enqueue.peek
     if dq_peek_info.nil?
      #  debugger
       eq_peek_info[:min_val]
     elsif eq_peek_info.nil?
       dq_peek_info[:min_val]
     else
       dqmin = dq_peek_info[:min_val]
       nqmin = eq_peek_info[:min_val]

       dqmin < nqmin ? dqmin : nqmin
     end
   end

  def enqueue(item)
    peek_info = @store_enqueue.peek
    item_hash = Hash.new
    if peek_info.nil?
      item_hash[:min_val] = item
      item_hash[:max_val] = item
    else
      peek_info[:min_val] > item ? item_hash[:min_val] = item : item_hash[:min_val] = peek_info[:min_val]
      peek_info[:max_val] < item ? item_hash[:max_val] = item : item_hash[:max_val] = peek_info[:max_val]
    end
    item_hash[:val] = item

    @store_enqueue.push(item_hash)

  end

  def dequeue
    if @store_dequeue.empty?
      until @store_enqueue.empty?
        item_hash = @store_enqueue.pop
        peek_info = @store_dequeue.peek
        if peek_info.nil?
          item_hash[:min_val] = item_hash[:val]
          item_hash[:max_val] = item_hash[:val]
        else
          peek_info[:min_val] > item_hash[:val] ? item_hash[:min_val] = item_hash[:val] : item_hash[:min_val] = peek_info[:min_val]
          peek_info[:max_val] < item_hash[:val] ? item_hash[:max_val] = item_hash[:val] : item_hash[:max_val] = peek_info[:max_val]
        end
        @store_dequeue.push(item_hash)
      end
      @store_dequeue.pop
    else

      @store_dequeue.pop
    end
  end

  def size
    @store_enqueue.size + @store_dequeue.size
  end

  def empty?
    @store_dequeue.empty? && @store_enqueue.empty?
  end

end

def much_beterer_max_widow(arr, w)
  window_s1 = StackQueue.new
  until window_s1.size == w
    window_s1.enqueue(arr.shift)
  end

  max_val = window_s1.max
  min_val = window_s1.min
  result = max_val - min_val
  until arr.empty?
    window_s1.dequeue
    window_s1.enqueue(arr.shift)
    max_val = window_s1.max
    min_val = window_s1.min
    cur_largest_diff = max_val - min_val
    result = cur_largest_diff if cur_largest_diff > result
  end

  result
end
