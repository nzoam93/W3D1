class Array
    def my_each(&prc) #takes in a proc object. Transforms it from a block
        for i in 0...self.length do
            prc.call(self[i])
        end
        return self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if prc.call(ele)} #my huge block here IS what I wanted to put in parentheses for my_each
        return new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if !prc.call(ele)}
        return new_arr
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        return false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if prc.call(ele)}
        return true
    end


    #Arrays
    def my_flatten
        return [self] if !self.is_a?(Array)
        flattened = []
        self.each do |ele|
            if ele.is_a?(Array)
                flattened += ele.my_flatten
            else
                flattened << ele
            end
        end
        return flattened
    end

    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new}
        new_arr.each.with_index do |ele,i|
            new_arr[i] = [self[i]] #this needs to remain an array. So put it enclosed in brackets
            args.each do |subarray|
                if subarray[i] == nil
                    new_arr[i] << nil
                else
                    new_arr[i] << subarray[i]
                end
            end
        end

        return new_arr
    end

    def my_rotate(rotations = 1)
        new_arr = Array.new(self.length) #creating a new_arr and setting it equal to self. This way, we can manipulate it without changing self
        new_arr.each.with_index do |ele, i|
            new_arr[i] = self[i]
        end
        if rotations > 0
            rotations.times do
                first_ele = new_arr.shift
                new_arr.push(first_ele)
            end
        else
            rotations *= -1
            rotations.times do
                last_ele = new_arr.pop
                new_arr.unshift(last_ele)
            end
        end
        return new_arr
    end

    def my_join(seperator = " ") #works well
        str = ""
        self.each.with_index do |ele, index|
            str += ele
            str += seperator if index != -1
        end
        return str
    end

    def my_reverse
        new_arr = []
        self.each.with_index do |ele, index|
            new_arr << self[-index - 1] #nice
        end
        return new_arr
    end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
