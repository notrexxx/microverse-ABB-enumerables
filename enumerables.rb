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

  def my_all?(param = nil)
    if block_given?
      my_each { |e| return false unless yield(e) }
    elsif param
      if param.class == Regexp
        my_each { |e| return false unless e.to_s.match(param)  }
      elsif param.class == Class
        my_each { |e| return false unless e.is_a? param  }
      else
        my_each { |e| return false unless e === param  }
      end
    else
      my_each { |obj| return false unless obj }
    end
    true
  end

  def my_any?(param = nil)
    if block_given?
      my_each { |e| return true if yield(e) }
    elsif param
      if param.class == Regexp
        my_each { |e| return true if e.to_s.match(param)  }
      elsif param.class == Class
        my_each { |e| return true if e.is_a? param  }
      else
        my_each { |e| return true if e === param  }
      end
    else
      my_each { |obj| return true if obj }
    end
    false
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
