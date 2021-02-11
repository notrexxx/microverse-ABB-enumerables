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

    #3
    def my_select

    end

    #4
    def my_all?

    end

    #5
    def my_any?

    end

    #6
    def my_none?

    end

    #7
    def my_map

    end

    #8
    def my_inject

    end

    #9
    def multiply_els

    end
  end
