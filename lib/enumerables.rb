module Enumerable
  def my_each
    return self if !block_given?
    for i in 0..self.length-1
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    return self if !block_given?
    arr = []
    for i in 0..self.length-1
      arr << yield(self[i], i)
    end
    arr
  end

  def my_select
    return self if !block_given?
    arr = []
    my_each do |ele|
      if yield(ele) == true
        arr << ele
      end
    end
    arr
  end

  def my_all?
    return self if !block_given?
    my_each do |ele|
      if yield(ele) == false
        return false
      end
    end
    true
  end

  def my_any?
    return self if !block_given?
    my_each do |ele|
      if yield(ele) == true
        return true
      end
    end
    false
  end

  def my_none?
    return self if !block_given?
    my_each do |ele|
      if yield(ele) == true
        return false
      end
    end
    true
  end

  def my_count
    return self if !block_given?
    count = 0
    my_each do |ele|
      if yield(ele) == true
      count += 1
      end
    end
    count
  end

  def my_map(proc = nil)
    return self if proc.nil? && !block_given?
    arr = []
    my_each do |ele|
      value = proc.nil? ? yield(ele) : proc.call(ele)
      arr << value
    end
    arr
  end

  def my_inject(acc = self[0])
    return self if !block_given?
    my_each do |ele|
      if ele == self[0]
        next
      else
      acc = yield(acc, ele)
      end
    end
    acc
  end
end

def multiply_els(arr)
  total = arr.my_inject{ |acc, ele| acc * ele }
  total
end
