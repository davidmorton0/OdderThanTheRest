require "test/unit/assertions"
include Test::Unit::Assertions

def oddest(arr)
	if arr == [] then return nil end
	oddness_counter = arr.map { |val| oddness_calculator(val)}
	most_odd = oddness_counter.max
	if oddness_counter.count(-1) > 1
		return nil
	elsif oddness_counter.count(-1) == 1
		return -1
	elsif oddness_counter.count(most_odd) > 1
		return nil
	else
		return arr[oddness_counter.index(most_odd)]
	end
end

def oddness_calculator(val)
	if val == -1
		return -1
	elsif val % 2 == 0
		return 0
	else
		return 1 + oddness_calculator((val - 1) / 2)
	end
end

assert_equal oddest([1, 2]), 1
assert_equal oddest([1, 3]), 3
assert_equal oddest([1, 5]), nil
