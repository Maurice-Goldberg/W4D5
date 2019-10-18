require "byebug"

class String
    def self.first_anagram?(str1, str2)         # O(n!)
        arr1 = str1.split("")
        perm = arr1.permutation.to_a
        perm.map {|ele| ele.join("") }.include?(str2)
    end

    def self.second_anagram?(str1, str2)        # O(n^2)
        arr1, arr2 = str1.chars, str2.chars
        arr1.each do |char|
            idx = arr2.find_index(char)
            if idx.nil?
                return false
            else
                arr2.delete_at(idx)
            end
        end
        
        arr2.empty?
    end

    def self.third_anagram?(str1, str2)         # O(n log(n))
        str1.chars.sort == str2.chars.sort
    end

    def self.fourth_anagram?(str1, str2)        # O(n)
        hash1 = Hash.new(0)
        str1.chars.each { |char| hash1[char]+=1 }
        str2.chars.each { |char| hash1[char]-=1 }
        hash1.val.all?{ |val| val == 0 }
    end
    
end

if __FILE__ == $PROGRAM_NAME
    # puts String.first_anagram?("gizmo", "sally")    #=> false
    # puts String.first_anagram?("elvis", "lives")    #=> true

    # puts String.second_anagram?("gizmo", "sally")    #=> false
    # puts String.second_anagram?("elvis", "lives")    #=> true
    puts String.second_anagram?("hellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworld", "hellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworld")    #=> true

    puts String.third_anagram?("gizmo", "sally")    #=> false

    puts String.third_anagram?("hellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworld", "hellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworldhellohappyworld")    #=> true

end