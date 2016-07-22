class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
      if @store[num - 1] == false
        @store[num - 1] = true
      end

  end

  def remove(num)
    validate!(num)
    if @store[num -1] == true
      @store[num -1] = false
    end
  end

  def include?(num)
    validate!(num)
    @store[num -1]

  end

  private

  def is_valid?(num)
    return true if num.between?(0, @store.count - 1)
    false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
  #  raise 'Not included' unless @store.include?(num)
    self[num].pop
  end

  def include?(num)
    self[num] == [num]

  end

  private

  def [](num)
    # self[num]
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self[num] << num
    @count += 1
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    self[num].pop
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
     @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    placeholder_arr = @store.flatten
    @store += Array.new(num_buckets) { Array.new }
    placeholder_arr.each do |el|
      insert(el)
      @count -= 1
    end

  end
end
