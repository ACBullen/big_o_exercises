def bad_two_sum?(arr, target)
  arr.each_with_index do |el, i|
    arr.each_with_index do |el2, j|
      return true if el + el2 == target && i != j
    end
  end

  false
end

def okay_two_sum?(arr, target)
  arr.each do |el|
    remainder = target - el
    found = arr.bsearch { |item| item == remainder }
    return true unless found == nil || found == el
  end

false
end

def two_sum_best?(arr, target)
  sum_hash = Hash.new(nil)
  arr.each do |el|
    sum_hash[el] = el
    remainder = target - el
    return true unless sum_hash[remainder] == nil || sum_hash[remainder] == el
  end

false
end
  arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6)
p okay_two_sum?(arr, 10)
