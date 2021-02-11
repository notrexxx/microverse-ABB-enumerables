# rubocop:disable Style/CaseEquality, Style/StringLiterals, Style/For
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

module Enumerable
  def my_each(arr)
    for i in arr do
      yield i
    end

    arr
  end

  def my_each_with_index(arr)
    for i in 0..(arr.length - 1) do
      yield i, arr[i]
    end

    arr
  end

  # 3
  def my_select(arr)
    arr_c = []

    for i in arr do
      r = yield (i)

      if r
        arr_c.push(i)
      end
    end

    arr_c
  end

  # 4
  def my_all? (arr)
 
    arr_c = []
  
      for i in arr do
        r = yield (i) 
       
        unless r 
         arr_c.push(i)
        end
    end
       
    arr_c
  end

  # 5
  def my_any?
  end

  # 6
  def my_none?
  end

  # 7
  def my_map
  end

  # 8
  def my_inject
  end

  # 9
  def multiply_els
  end
end
