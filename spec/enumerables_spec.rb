require "enumerables.rb"

describe Enumerable do
  describe "#my_each" do
    it "should behave like each, iterating and doing something with the element being iterated" do
      arr = [1, 2, 3, 4]
      res1 = []
      res2 =[]
      arr.my_each { |ele| res1 << ele * 2 }
      arr.each { |ele| res2 << ele * 2 }
      expect(res1).to eq([2, 4, 6, 8])
      expect(res2).to eq([2, 4, 6, 8])
    end
    it "should not modify the array" do
      arr = [1, 2, 3, 4]
      expect(arr.my_each { |ele| ele * 2 }).to eq([1, 2, 3, 4])
      expect(arr.each { |ele| ele * 2 }).to eq([1, 2, 3, 4])
    end
  end

  describe "#my_each_with_index" do
    it "should be able to print the value of the element and its index" do
      arr = [1, 2, 3]
      expect{arr.my_each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }}.to output("1 is in index 0\n2 is in index 1\n3 is in index 2\n").to_stdout
      expect{arr.each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }}.to output("1 is in index 0\n2 is in index 1\n3 is in index 2\n").to_stdout
    end
    it "The value and the index should be able to interact with each other" do
      arr = [1, 2, 3]
      res1 = []
      res2 = []
      arr.my_each_with_index { |ele, idx| res1 << ele * idx }
      arr.each_with_index { |ele, idx| res2 << ele * idx }
      expect(res1).to eq([0, 2, 6])
      expect(res2).to eq([0, 2, 6])
    end
  end

  describe "#my_select" do
    it "should select elements that return true to the comparison passed in the block" do
      arr = [1, 2, 3, 4]
      res1 = arr.my_select{ |ele| ele.even? }
      res2 = arr.select{ |ele| ele.even?}
      expect(res1).to eq([2, 4])
      expect(res2).to eq([2, 4])
    end
  end

  describe "#my_all?" do
    it "Should return true when all the elements are of the same condition, like the all? method" do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.my_all?{ |n| n.is_a? Integer}).to eq(true)
      expect(arr.all?{ |n| n.is_a? Integer}).to eq(true)
    end
    it "Should return false when at least one element does not match the criteria, like the all? method" do
      arr = [1, 2, 3, "M", 5, 6]
      expect(arr.my_all?{ |n| n.is_a? Integer}).to eq(false)
      expect(arr.all?{ |n| n.is_a? Integer}).to eq(false)
    end
  end

  describe "#my_any?" do
    it "should return true when at least one element matches the criteria, like any?"do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.any? { |n| n == 3}).to eq(true)
      expect(arr.my_any? { |n| n == 3}).to eq(true)
    end
    it "Should return false if no elements match the criteria, like any?" do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.any? { |n| n == 25}).to eq(false)
      expect(arr.my_any? { |n| n == 25}).to eq(false)
    end    
  end

  describe "#my_none" do 
    it "Should return true when none of the elements match the criteria" do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.none? { |n| n == 25}).to eq(true)
      expect(arr.my_none? { |n| n == 25}).to eq(true)
    end
    it "Should return false when at least of the elements match the criteria" do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.none? { |n| n == 5}).to eq(false)
      expect(arr.my_none? { |n| n == 5}).to eq(false)
    end
  end

  describe "#my_count" do
    it "Should return the number of contained items that evaluate to true in the block" do
      arr = (10..20).to_a
      res1 = arr.my_count { |n| n.even? }
      res2 = arr.count { |n| n.even? }
      expect(res1).to eq(6)
      expect(res2).to eq(6)
    end
  end

  describe "#my_map" do
    it "Should take a proc as an argument" do
      arr = (1..10).to_a
      proc1 = proc do |n|
        n * 2
      end
      res1 = arr.my_map(&proc1)
      res2 = arr.map(&proc1)
      expect(res1).to eq([2, 4, 6, 8, 10, 12, 14, 16, 18, 20])
      expect(res2).to eq([2, 4, 6, 8, 10, 12, 14, 16, 18, 20])
    end
    it "It should evaluate to an array" do
      arr = (1..5).to_a
      res1 = arr.my_map { |n| n * 2 }
      res2 = arr.map { |n| n * 2 }
      expect(res1).to eq([2, 4, 6, 8, 10])
      expect(res1).to eq([2, 4, 6, 8, 10])
    end
  end

  describe "#my_inject" do
    it "Should evaluate to the result of the acumulator" do
      arr = (1..10).to_a
      res1 = arr.my_inject{ |acc, ele| acc + ele }
      res2 = arr.inject{ |acc, ele| acc + ele }
      expect(res1).to eq(55)
      expect(res2).to eq(55)
    end
  end

end






