module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if !block_given?
      return to_enum(:my_each)
    end

    for elem in self
      yield elem
    end
    return self
  end

  def my_each_with_index
    if !block_given?
      return to_enum(:my_each_with_index)
    end

    i = 0
    while i < self.length do
      yield self[i], i
      i += 1
    end
    return self
  end

  def my_select
    if !block_given?
      return to_enum(:my_select)
    end

    result = []
    for elem in self
      if yield(elem)
        result << elem
      end
    end
    return result
  end

  def my_all?
    if !block_given?
      return true
    end

    for elem in self
      if !yield(elem)
        return false
      end
    end
    return true
  end

  def my_any?
    if !block_given?
      return true
    end

    for elem in self
      if yield(elem)
        return true
      end
    end
    return false
  end

  def my_none?
    if !block_given?
      return false
    end

    for elem in self
      if yield(elem)
        return false
      end
    end
    return true
  end

  def my_count
    count = self.length
    if block_given?
      count = 0
      for elem in self
        count += 1 unless !yield(elem)
      end
    end
    return count
  end

  def my_map
    if !block_given?
      return to_enum(:my_map)
    end

    result = []
    for elem in self
      result << yield(elem)
    end
    return result
  end

  def my_inject(initial_value)
    result = initial_value
    for elem in self
      result = yield(result, elem)
    end
    return result
  end

end
