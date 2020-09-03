require "pry"

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    input -= 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && @board[index] == " "
      true
    else
      false
    end
  end

  def turn_count
    count = 0
    @board.each do |xo|
      if xo == "X" || xo == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    x = 0
    o = 0
    current = ""
    @board.each do |index|
      if index == "X"
        x += 1
      elsif index == "O"
        o += 1
      end
    end
    if x > o
      current = "O"
    else
      current = "X"
    end
    current
  end

  def turn
    puts "PLEASE ENTER A NUMBER BETWEEN 1-9:"
    input = gets.chomp
    input = input_to_index(input)
    if valid_move?(input) == false
      turn
    end
    move(input, current_player)
    display_board
  end

  def won?
    win = []
    num_board = @board
    WIN_COMBINATIONS.each do |c|

      combo1 = c[0]
      combo2 = c[1]
      combo3 = c[2]

      num_board[c[0]] = c[0]
      num_board[c[1]] = c[1]
      num_board[c[2]] = c[2]

      pos1 = num_board[c[0]].index
      pos2 = num_board[c[1]].index
      pos3 = num_board[c[2]].index

      if combo1 == pos1 && combo2 == pos2 && combo3 == pos3
        win = c
      end
    end
    if win = []
      false
    else
      win
    end
  end

end
