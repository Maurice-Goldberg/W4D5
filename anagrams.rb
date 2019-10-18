require "byebug"
class String
    def self.first_anagram?(str1, str2)
        arr1 = str1.split("")
        perm = arr1.permutation.to_a
        perm.map {|ele| ele.join("") }.include?(str2)
    end

    def self.second_anagram?(str1, str2)
        arr1, arr2 = str1.chars, str2.chars
        arr1.each do |char|
            arr2.delete(char)
        end
        
        arr2.empty?
    end
    
end

if __FILE__ == $PROGRAM_NAME
    puts String.first_anagram?("gizmo", "sally")    #=> false
    puts String.first_anagram?("elvis", "lives")    #=> true

end