# require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    return @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)

    @store[key.hash % num_buckets].insert(key,val)
    @count += 1
    resize! if @count > num_buckets
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash % num_buckets].remove(key)
    @count -= 1
  end

  def each

  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!

    placeholder_arr = []
    @store.each {|link| placeholder_arr << link }
    puts placeholder_arr
    num_buckets += num_buckets
    @store =  Array.new(num_buckets) { LinkedList.new }
    puts ""
    puts ""
    puts @store.count
    placeholder_arr.each do |link|
      @store.delete(link.key)
    end

    placeholder_arr.each do |link|
      @store.set(link.key, link.value)
    end
    @store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end






p h = HashMap.new(2)
h.set("a",2)
h.set("b",3)
puts "\n"
p h.inspect
p h.set("c",4)
