class Cage
  attr_accessor :cage, :last_move

  def initialize()
    @cage = Array.new(6){Array.new(7, '_')}
  end

  def add_coin(column, coin)
    main_row = 5
    main_row.downto(0) do |row|
      if @cage[row][column] == '_'
        @cage[row][column] = coin
        main_row = row
        break
      end
    end

    @last_move = [main_row, column, coin]
  end

  def game_over?(source)
    if horizontal_check(source)
      return source[2]
    elsif vertical_check(source)
      return source[2]
    elsif left_diag_check(source)
      return source[2]
    elsif right_diag_check(source)
      return source[2]
    else
      return false
    end
  end

  def pretty_print
    for row in @cage
      puts row.join('  ')
      puts ""
    end
  end

  # HELPER METHODS
  def horizontal_check(source)
    coin = source[2]
    row = @cage[source[0]].join('')
    row.include?(coin*4)
  end

  def vertical_check(source)
    coin = source[2]
    col = source[1]
    col_str = ''
    for i in 0..5
      col_str += @cage[i][col]
    end
    col_str.include?(coin*4)
  end

  def left_diag_check(source)
    row, col, coin = source
    rows, cols = @cage.length, @cage[0].length

    # Check diagonals going up and to the left
    (0..rows-4).each do |start_row|
      (3..cols-1).each do |start_col|
        diagonal = (0..3).map { |i| @cage[start_row + i][start_col - i] }.join
        return true if diagonal == coin * 4
      end
    end

    # Check diagonals going down and to the left
    (3..rows-1).each do |start_row|
      (3..cols-1).each do |start_col|
        diagonal = (0..3).map { |i| @cage[start_row - i][start_col - i] }.join
        return coin if diagonal == coin * 4
      end
    end

    false
  end

  def right_diag_check(source)
    row, col, coin = source
    rows, cols = @cage.length, @cage[0].length

    # Check diagonals going up and to the right
    (0..rows-4).each do |start_row|
      (0..cols-4).each do |start_col|
        diagonal = (0..3).map { |i| @cage[start_row + i][start_col + i] }.join
        return true if diagonal == coin * 4
      end
    end

    # Check diagonals going down and to the right
    (3..rows-1).each do |start_row|
      (0..cols-4).each do |start_col|
        diagonal = (0..3).map { |i| @cage[start_row - i][start_col + i] }.join
        return coin if diagonal == coin * 4
      end
    end

    false
  end
end

# mock_cage = Cage.new
# mock_cage.add_coin(3, 'B')
# mock_cage.add_coin(4, 'B')
# mock_cage.add_coin(4, 'B')
# mock_cage.add_coin(5, 'B')
# mock_cage.add_coin(5, 'B')
# mock_cage.add_coin(5, 'B')

# mock_cage.add_coin(2, 'R')
# mock_cage.add_coin(3, 'R')
# mock_cage.add_coin(4, 'R')
# mock_cage.add_coin(5, 'R')
# mock_cage.pretty_print
# puts mock_cage.game_over?
