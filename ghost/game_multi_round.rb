require_relative "player"

class Game
    attr_reader :current_player, :dictionary, :current_player, :player_1, :player_2
    def initialize
        @player_1 = Player.new("Tom")
        @player_2 = Player.new("Hanks")
        @fragment = ""
        @dictionary = File.read("./dictionary.txt").split
        @current_player = @player_1
        @round_over = false
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def valid_play?(string) #sees if the new_word can form a real word
        new_word = @fragment + string
        @dictionary.each do |word|
            return true if word[0...new_word.length].include?(new_word)    #or could use "start_with(str)"
        end
        return false
    end


    def take_turn(player)
        player_input = player.guess
        if self.valid_play?(player_input)
            @fragment += player_input
            puts "Your word so far is #{@fragment.upcase}"
            return true
        else
            puts "#{player.name} has made an invalid guess and has lost the game"
            @round_over = true
            return false
        end
    end

    def play_round
        while @round_over == false #goes on until the round is over
            self.take_turn(@current_player)
            self.next_player!
        end
        return "Great game!"
    end
end

my_game = Game.new
my_game.play_round
