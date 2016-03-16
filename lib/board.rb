class Board

	attr_accessor :cells, :token, :player

	def initialize
		reset!
	end

	def reset!
		#How the board looks at the start of a game
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(position)
		#gets user input through argument
		#looks up the value
		cells[position.to_i-1]
	end

	def turn_count
		#keeps track of the number of moves that have been played
		cells.count {|cell| cell == "X" || cell == "O"}
	end

	def update(position, player)
		#updates the board by position
		#fills it with the current player's token
		cells[position.to_i-1] = player.token
	end

	def full?
		#returns true if the board is full
	cells.all? {|check| check == "X" || check == "O"}
	end

	def taken?(position)
		#returns true/false for a specific positon on the board
		#Refactored to simplify. Uses implicit return values of boolean expressions
		cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
	end

	def valid_move?(position)
		#true if it is on the board and is not #TAKEN
		position.to_i.between?(1,9) && !taken?(position)
	end

  def get_cells(array)
    array.map{ |x| x = @cells[x] }
  end
end
