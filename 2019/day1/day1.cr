def file_reader(filename : String)
  nums = [] of Int32

  file = File.open(filename, "r")
  file.each_line() do |line|
    nums << line.to_i32
  end
  nums
end

# take its mass, divide by three, round down, and subtract 2.
def calculate_fuel(mass : Int)
  return ((mass / 3) - 2).to_i
end

# take its mass, divide by three, round down, and subtract 2
# add fuel for that fuel recursively
def calculate_fuel_recursively(mass : Int)
  tmp = ((mass / 3) - 2).to_i
  if tmp <= 0
    return 0
  end
  return tmp += calculate_fuel_recursively(tmp)
end

nums = file_reader("day1.txt")
sum = 0
nums.each do |i|
  sum += calculate_fuel(i)
end

p "The sum of the fuel requirements for all of the modules on your spacecraft is #{sum}."

part_2_sum = 0
nums.each do |i|
  part_2_sum += calculate_fuel_recursively(i)
end

p "The sum of the fuel requirements for all of the modules on your spacecraft when also taking into account the mass of the added fuel is #{part_2_sum}"
