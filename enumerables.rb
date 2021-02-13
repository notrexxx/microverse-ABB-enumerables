# rubocop:disable Style/CaseEquality
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    var = self if instance_of?(Array)
    var = to_a if instance_of?(Range) || Hash

    i = 0
    while i < var.size
      yield(var[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    var = to_a if instance_of?(Range) || Hash

    i = 0
    while i < var.size
      yield(var[i], i)
      i += 1
    end
    self
  end

  def my_select
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
      if param.instance_of?(Regexp)
        my_each { |e| return false unless e.to_s.match(param) }
      elsif param.instance_of?(Class)
        my_each { |e| return false unless e.is_a? param }
      else
        my_each { |e| return false unless e === param }
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
      if param.instance_of?(Regexp)
        my_each { |e| return true if e.to_s.match(param) }
      elsif param.instance_of?(Class)
        my_each { |e| return true if e.is_a? param }
      else
        my_each { |e| return true if e === param }
      end
    else
      my_each { |obj| return true if obj }
    end
    false
  end

  def my_none?(param = nil)
    if block_given?
      my_each { |e| return false if yield(e) }
    elsif param
      if param.instance_of?(Regexp)
        my_each { |e| return false if e.to_s.match(param) }
      elsif param.instance_of?(Class)
        my_each { |e| return false if e.is_a? param }
      else
        my_each { |e| return false if e === param }
      end
    else
      my_each { |obj| return false if obj }
    end
    true
  end

  def my_count(item = nil)
    count = 0

    if block_given?
      my_each { |i| count += 1 if yield(i) }
    elsif item
      my_each { |i| count += 1 if item == i }
    else
      count = size
    end

    count
  end

  def my_map(var = nil)
    return to_enum(:my_map) unless block_given? || var

    arr_c = []
    if var
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

  def my_inject(initial = nil, symbol = nil)
    raise LocalJumpError, 'no block given' if !block_given? && initial.nil? && symbol.nil?

    arr = Array self
    memo = arr[0]
    arr = arr[1...arr.length] if initial.nil? || initial.is_a?(Symbol)

    if initial
      symbol = initial if initial.is_a?(Symbol)
      memo = initial unless initial.is_a?(Symbol)
    end

    if block_given?
      arr.my_each { |e| memo = yield(memo, e) }
    elsif symbol
      case symbol
      when :+
        arr.my_each { |e| memo += e }
      when :*
        arr.my_each { |e| memo *= e }
      end
    end

    memo
  end

  def multiply_els(arr)
    arr.to_a.my_inject { |a, b| (a * b) }
  end
end

# rubocop:enable Style/CaseEquality
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
