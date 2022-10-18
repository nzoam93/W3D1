require "set"


# dict.each do |word|
#     p true if word.include?(str)
# end

def prac(str,dict)
    set_dict = dict.to_set
    set_dict.each do |word|
        return true if word[0...str.length].include? str
        return true if word.start_with?(str)
    end
    return false
end

dict = ["abc", "def", "hij"]
str = "hi"

p prac(str,dict)

# set = dict.to_set
# p set.include?(str)
