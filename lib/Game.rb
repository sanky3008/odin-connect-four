class Game
  attr_accessor :p1, :p2, :cage, :active

  def initialize()
    @p1 = Player.new('R')
    @p2 = Player.new('B')
    @cage = Cage.new()
    @active = @p2
  end

  def play_game()
    while true
      if @active == @p1
        @active = @p2
      else
        @active = @p1
      end

      puts "State of the game:\n"
      @cage.pretty_print
      puts "\n\n#{@active.coin}, please choose a column!"

      source = @cage.add_coin(gets.chomp.to_i, @active.coin)

      # puts source

      if @cage.game_over?(source)
        winner = @cage.game_over?

        puts "\nWINNER: #{winner}"
      end
    end
  end
end
