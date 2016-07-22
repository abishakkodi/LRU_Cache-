# require_relative 'p02_hashing'
# require 'byebug'




class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key.hash % num_buckets] << key
    @count += 1
    if @count > num_buckets
      resize!
    end
  end

  def include?(key)
    # return self[key].include?(key)

    return @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[key.hash % num_buckets].pop
      @count -= 1
    end

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
      @store += Array.new(num_buckets) { Array.new }
  end

end
