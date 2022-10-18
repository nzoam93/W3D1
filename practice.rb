

# class Array

#     def positive_diag_winner?(token)
#         rows = self.length
#         cols = self[0].length
#         count = 0
#         (0...rows).each do |row|
#             (0...cols).each do |col|
#                 count += 1 if self[row][col] == token && row == col
#             end
#         end
#         return count == rows
#     end

#     def negative_diag_winner?(token)
#         rows = self.length
#         cols = self[0].length
#         count = 0
#         (0...rows).each do |row|
#             (0...cols).each do |col|
#                 count += 1 if self[row][col] == token && row + col == self.length - 1
#             end
#         end
#         return count == rows
#     end

#     def diag_winner?(token)
#         positive_diag_winner?(token) || negative_diag_winner?(token)
#     end

#     def horizontal_winner?(token)
#         rows = self.length
#         cols = self[0].length
#         (0...rows).each do |row|
#             count = 0
#             (0..cols).each do |col|
#                 count += 1 if self[row][col] == token
#             end
#             puts count
#             return true if count == rows
#         end
#         return false
#     end

#     def vertical_winner?(token)
#         rows = self.length
#         cols = self[0].length
#         (0...cols).each do |col|
#             count = 0
#             (0...rows).each do |row|
#                 count += 1 if self[row][col] == token
#             end
#             puts count
#             return true if count == rows
#         end
#         return false
#     end
# end


# arr_1 = [[:Q,:K,:Y,:P,:O],
#          [:X,:X,:Y],
#          [:T,:P,:Y,:R]]

# p arr_1.diag_winner?(:X)
# p arr_1.horizontal_winner?(:X)
# p arr_1.vertical_winner?(:Y)


# return_value = [1, 2, 3].each do |num|
#     puts num
#    end.each do |num|
#     puts num
#    end

# p return_value

# arr = [[1,2,3],[4,5,6],[7,8,9]]

# (0...arr.length).each do |row|
#     p arr[row]
# end

# array = ["11", "21", "5"]
# p array.map! { |str| str.to_i }


input = "1 2"
position = input.split(" ")
p position
