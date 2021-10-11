# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.empty?
        return nil
    else
        return self.max - self.min 
    end 
  end 

  def average
    if self.empty?
        return nil
    else
        return self.sum / self.length.to_f
    end 
  end

  def median
      sorted = self.sort
      return nil if self.empty?
      i = sorted.length/2
      if sorted.length.even?
        return (sorted[i] + sorted[i -1]) / 2.0
      else
        return sorted[i]
      end 
  end

  def counts
      hash = Hash.new(0)
      self.each do |ele|
        hash[ele] += 1
      end 
      hash
  end

  def my_count(value)
      counts[value]
  end

  def my_index(value)
    return nil if !self.include?(value)
      self.each.with_index do |ele, i|
        return i if ele == value
      end 
  end

  def my_uniq
      counts.keys
  end

  def my_transpose
      
    grid  = Array.new(self.length) {Array.new(self.length)}
    x = self.length
    y = self.length

    (0...x).each do |i|
        (0...y).each do |i2|
            grid[i][i2] = self[i2][i]
        end 
    end 
    grid

  end




end
