def my_min(list)

  list.each do |el|
    is_max = true
    list.each do |el2|
      is_max = false if el2 < el
    end
    return el if is_max
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min(list)

def my_min2(list)
  cur_min = list.first
  list.each do |el|
    cur_min = el if el < cur_min
  end
  cur_min
end

# p my_min2(list)

def largest_contiguous_subsum(list)
  subsets = []
  list.each_index do |i|
    j = i
    next if j >= list.length
    while j < list.length
      subsets << list[i..j].reduce(&:+)
      j += 1
    end
  end
  max = subsets.first
  subsets.each do |el|
    max = el if el > max
  end
  max

end

list = [-5, -1, -3]



def largest_contiguous_subsum2(list)
  if list.all? { |el| el < 0 }
    return list.max
  end
  
  total_max = list.first
  cur_max = list.first
  list.drop(1).each do |el|
    cur_max += el
    if cur_max > total_max
      total_max = cur_max
    elsif cur_max < 0
      cur_max = 0
    end
  end

  total_max
end
   p largest_contiguous_subsum2(list)
