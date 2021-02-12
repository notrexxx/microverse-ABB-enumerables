# rubocop:disable Style/CaseEquality, Style/StringLiterals, Style/For
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    var = self if self.class == Array
    var = to_a if self.class == Range or Hash

    i = 0
    while i < var.size
      yield(var[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    var = to_a if self.class == Range or Hash

    i = 0
    while i < var.size
      yield(var[i], i)
      i += 1
    end
    self
  end

  def my_select()
    return to_enum(:my_select) unless block_given?
  
    arr_c = []
    
    each do |i|
      arr_c.push(i) if yield i
    
    end
    arr_c
  end

  def my_all?(arr)
    nof = 0

    for i in arr do
      r = yield(i)
      nof += 1 unless r
    end

    nof == 0
  end

  def my_any?
    nof = 0

    for i in arr do
      r = yield(i)
      nof += 1 if r
    end

    nof > 0
  end

  # 6
  def my_none?
  end

  # 7
  def my_map(x = nil)
    return to_enum(:my_map) unless block_given? or x

    arr_c = []
    if x
      my_each do |e| 
        arr_c.push(arg.call(e)) 
      end
    else
      my_each do |e| 
        arr_c.push(yield(e)) 
      end
    end
    arr_c
  end

  # 8
  def my_inject
  end

  # 9
  def multiply_els
  end
end
