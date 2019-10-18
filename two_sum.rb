class Array
    def self.two_sum_brute(arr, sum)
        arr.each_with_index do |el1, i|
            arr.each_with_index do |el2, j|
                if i < j
                    return true if el1 + el2 == sum
                end
            end
        end
        false
    end

    def self.two_sum_sort(arr, sum) #n*log(n)
        arr.sort!

        until arr.length == 0
            el = arr.shift
            return true if arr.bsearch { |x| x == sum-el }
        end
        false
    end

    def self.two_sum_hash(arr, sum) #O(n)
        hash = {}
        arr.each do |num|
            hash[num] = true
        end
        hash.each_key do |key|
            return true if hash[sum - key]
        end
        false
    end
end


if __FILE__ == $PROGRAM_NAME
    arr = [0, 1, 2, 5, 6, 7, 7, 11]

    p Array.two_sum_hash(arr, 9) # => true
    p Array.two_sum_brute(arr, 9) # => true
end