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
    @store.dup
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @store_dequeue = MyStack.new
    @dq_max = nil
    @dq_min = nil
    @store_enqueue = MyStack.new
    @nq_max = nil
    @nq_max = nil

  end

  def max
    unless @dq_max.nil? || @nq_max.nil?
      return @dq_max if @dq_max > @nq_max
      return @nq_max if @nq_max > @dq_max
    end
    return @nq_max if @dq_max.nil?
    return @dq_max if @nq_max.nil?
  end

  def enqueue(item)
    @nq_min = item if @nq_min.nil? || @nq_min > item
    @nq_max = item if @nq_max.nil? || @nq_max < item
    @store_enqueue.push(item)
  end

  def dequeue
    if @store_dequeue.empty?
      until @store_enqueue.empty?
        shifting_to_dq = @store_enqueue.pop
        @dq_max = shifting_to_dq if @dq_max.nil? || shifting_to_dq > @dq_max
        @dq_min = shifting_to_dq if @dq_min.nil? || shifting_to_dq < @dq_min
        @store_dequeue.push(shifting_to_dq)
      end
      @nq_max = nil
      @nq_min = nil
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


# p niave_max_widow([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p niave_max_widow([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p niave_max_widow([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p niave_max_widow([1, 3, 2, 5, 4, 8], 5) == 6
