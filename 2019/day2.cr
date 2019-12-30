def file_reader(filename : String)
  nums = [] of Int32

  file = File.open(filename, "r")
  file.each_line() do |line|
    nums = line.split(',').map { |i| i.to_i32 }
  end
  nums
end

def checker(codes : Array(Int32), nums : Array(Int32), pos_1_modifier : Int32, pos_2_modifier : Int32)
  nums[1] = pos_1_modifier
  nums[2] = pos_2_modifier

  if codes[0] == 1
    nums[codes[3]] = nums[codes[1]] + nums[codes[2]]
  elsif codes[0] == 2
    nums[codes[3]] = nums[codes[1]] * nums[codes[2]]
  elsif codes[0] == 99
    puts "Halting..."
    return
  else
    puts "Something went wrong."
    puts codes[0]
    return
  end
end

nums = file_reader("day2.txt")

# day 2 part 2
nums_copy = nums.clone
(0..1000).each do |i|
  (0..1000).each do |j|
    nums_copy.each_slice(4) { |e| checker(e, nums_copy, i, j) }
    if nums_copy[0] == 19690720
      # Find the input noun and verb that cause the program to produce the output 19690720. What is 100 * noun + verb?
      puts "SUCCESS"
      puts 100 * i + j
      exit()
    else
      nums_copy = nums.clone
    end
  end
end
