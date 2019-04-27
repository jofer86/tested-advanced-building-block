require "enumerables.rb"
describe Enumerable do

  let(:arr) { (1..4).to_a }
  
  describe "#my_each" do
    it "should behave like each, iterating and doing something with the element being iterated" do
      res1 = []
      arr.my_each { |ele| res1 << ele * 2 }
      expect(res1).to eq([2, 4, 6, 8])      
    end
    it "should not modify the array" do
      expect(arr.each { |ele| ele * 2 }).to eq([1, 2, 3, 4])
    end
  end

  describe "#my_each_with_index" do
    it "The value and the index should be able to interact with each other" do
      res1 = []
      arr.my_each_with_index { |ele, idx| res1 << ele * idx }     
      expect(res1).to eq([0, 2, 6, 12])
    end
  end

  describe "#my_select" do
    it "should select elements that return true to the comparison passed in the block" do
      res1 = arr.my_select{ |ele| ele.even? }
      expect(res1).to eq([2, 4])
    end
  end

  describe "#my_all?" do
    it "Should return true when all the elements are of the same condition, like the all? method" do
      expect(arr.my_all?{ |n| n.is_a? Integer}).to eq(true)
    end
    it "Should return false when at least one element does not match the criteria, like the all? method" do
      arr1 = [1, 2, 3, "M", 5, 6]
      expect(arr1.my_all?{ |n| n.is_a? Integer}).to eq(false)
    end
  end

  describe "#my_any?" do
    it "should return true when at least one element matches the criteria, like any?"do
      expect(arr.any? { |n| n == 3}).to eq(true)
    end
    it "Should return false if no elements match the criteria, like any?" do
      expect(arr.any? { |n| n == 25}).to eq(false)    
    end
  end

  describe "#my_none" do 
    it "Should return true when none of the elements match the criteria" do
      expect(arr.none? { |n| n == 25}).to eq(true)
    end
    it "Should return false when at least of the elements match the criteria" do
      expect(arr.none? { |n| n == 2}).to eq(false)
    end
  end

  describe "#my_count" do
    it "Should return the number of contained items that evaluate to true in the block" do
      res1 = arr.my_count { |n| n.even? }    
      expect(res1).to eq(2)
    end
  end

  describe "#my_map" do
    it "Should take a proc as an argument" do
      proc1 = proc do |n|
        n * 2
      end
      res1 = arr.my_map(&proc1)
      res2 = arr.map(&proc1)
      expect(res1).to eq([2, 4, 6, 8])      
    end
    it "It should evaluate to an array" do
      res1 = arr.my_map { |n| n * 2 }
      expect(res1).to eq([2, 4, 6, 8])
    end
  end

  describe "#my_inject" do
    it "Should evaluate to the result of the acumulator" do
      res1 = arr.my_inject{ |acc, ele| acc + ele }
      expect(res1).to eq(10)
    end
  end
end
