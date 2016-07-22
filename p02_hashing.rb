require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    p self
    hi = gets
    return 0 if self.empty?

    hash_int = 0
    self.each_with_index {|el, i| hash_int += el.hash + i ** i }
    hash_int
  end
end

class String
  def hash
    placeholder_arr = self.chars
    placeholder_arr.hash * self.length

    # hash_int = 0
    # placeholder_arr.each{|el| hash_int += el.hash + i ** i}
    # results_hash.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    results_hash = 0
    arr = self.sort.to_h
    arr.each_pair do |keys,values|
       results_hash +=  values.hash  * keys.hash + keys.hash.hash
      end
    results_hash
  end 
end
