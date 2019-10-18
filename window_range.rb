require "MyQueue"

def naive_solution(arr, w)
    current_max_range = nil
    i = 0
    while w < arr.length-1
        max = arr[i..w].max     
        min = arr[i..w].min     
        i+=1
        w+=1
        current_max_range = arr[arr.index(min)..arr.index(max)] if max-min > current_max_range
    end
    current_max_range
end

def 







naive_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
naive_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
naive_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
naive_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8