require "byebug"

class Array
    def my_min
        (0..self.length - 1).each do |i|
            return self[i] if self[(i+1)..-1].all? {|num| num > self[i] } 
        end
    end

    def my_min_optimized
        # self.inject { |min, ele| ele if ele < min } ASK ABOUT IN FLEXTIME
        min = self[0]
        self.each {|ele| min = ele if ele < min}
        min
    end

    def largest_contiguous_subsum
        pairs = []
        (0..self.length-1).each do |i|
            (0..self.length).each do |j|
                if i <= j
                    pairs << self[i..j]
                end
            end
        end

        subsums = []
        pairs.each do |pair|
            subsums << pair.sum
        end

        subsums.max
    end

    def largest_contiguous_subsum_opt
        max = self[0]
        sum = 0
        self.each_with_index do |ele, i|
            if ele > max
                max = ele
                sum = max
            else
                sum += ele
                max = sum if sum > max
            end
        end
        max
    end
end

if __FILE__ == $PROGRAM_NAME

    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

    list = [5, 3, -7]
    puts list.largest_contiguous_subsum_opt # => 8

    list = [2, 3, -6, 7, -6, 7]
    puts list.largest_contiguous_subsum_opt # => 8 (from [7, -6, 7])

    list = [-5, -1, -3]
    puts list.largest_contiguous_subsum_opt # => -1 (from [-1])
end


