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
    diag = ""

    while row >= 0 and col >= 0
      row -= 1
      col -= 1
    end

    while row < @cage.length && col < @cage[0].length
      diag += @cage[row][col]
      row += 1
      col += 1
    end

    diag.include?(coin*4)
  end

  def right_diag_check(source)
    row, col, coin = source
    diag = ""

    # puts "#{row}, #{col}"
    while row < 5 && col >= 0
      puts "#{row}, #{col}"
      row += 1
      col -= 1
    end

    # puts "#{row}, #{col}"

    while row >= 0 && col < @cage[0].length
      # puts "#{row}, #{col}"
      diag += @cage[row][col]
      row -= 1
      col += 1
    end

    diag.include?(coin*4)
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
