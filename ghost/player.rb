class Player
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess #woohoo, I did the rescue thing correctly!
        alphabet = ("a".."z").to_a
        begin
            puts "#{@name}, please guess a single character"
            user_char = gets.chomp
            raise "" if !alphabet.include?(user_char) || user_char.length > 1
        rescue
            puts "You must input in a SINGLE LETTER"
            retry
        end
        return user_char
    end
end
