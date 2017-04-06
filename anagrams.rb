def first_anagram?(str1, str2)
  possible_anagrams = str1.split('').permutation
  possible_anagrams = possible_anagrams.map do |ar|
    ar.join('')
  end

  possible_anagrams.include?(str2)
end

def second_anagram?(str1, str2)
  str1 = str1.split('')
  str2 = str2.split('')
  str1.each_with_index do |l, i|
    # next if i + 1 == str1.length
    str2.each_with_index do |el, j|
      # next if j + 1 == str2.length
      if el == l
        str1 = str1 - [el]
        str2 = str2 - [l]
      end
    end
  end

  str1.empty? && str2.empty?
end

def third_anagram?(str1, str2)
  str1 = str1.split("").sort
  str2 = str2.split("").sort

  str1 == str2

end

def fourth_anagram?(str1, str2)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)
  str1.split("").each do |el|
    first_hash[el] += 1
  end
  str2.split("").each do |e|
    second_hash[e] += 1
  end

  first_hash == second_hash
end

def bonus_anagram?(str1, str2)
  freq_hash = Hash.new(0)
  str1.split('').each do |el|
    freq_hash[el] += 1
  end
  str2.split('').each do |el|
    freq_hash[el] -= 1
  end

  freq_hash.all? {|k, v| v == 0}
end



p bonus_anagram?("gizmo", "sally")
p bonus_anagram?("elvis", "lives")
