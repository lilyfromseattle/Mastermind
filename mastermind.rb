class Mastermind
	def initialize(winning_pattern)
	@winning_pattern = winning_pattern
	@guesses = []
	@past_guesses = []
	@reds = 0
	@whites = 0
	@counter = 0
	@rows = rows
	@row_number = 0

	def print_row(difficulty)
		if difficulty.downcase == "easy"
			multiply_rows(12)
			@row_number = 12
		elsif difficulty.downcase == "medium"
			multiply_rows(10)
			@row_number = 10
		elsif difficulty.downcase == "hard"
			multiply_rows(8)
			@row_number = 8
		end
	end

	def multiply_rows(x)
		for y in 1..x
			@rows << "0 0 0 0 #{"O".colorize(:red)} #{"O".colorize(:yellow)}"
		end
	end
			
			
	end

	def colorize_guess(guess)
		if guess == "red"
			guess = "0".colorize(:red)
		elsif guess == "orange"	
			guess = "0".colorize(:orange)
		elsif guess == "yellow"
			guess = "0".colorize(:yellow)
		elsif guess == "green"
			guess = "0".colorize(:green)
		elsif guess == "blue"
			guess = "0".colorize(:blue)
		elsif guess == "black"
			guess = "0".colorize(:black)
		elsif guess == "white"		
			guess = "0".colorize(:white)
		elsif guess == "tan"		
			guess = "0".colorize(:tan)
		else
		end
	end

	def red_pegs(peg)
		for guess in @guesses
			if @guesses.index(guess) == @winning_pattern.index(peg)
				@reds = @reds + 1
			end
		end
	end

	def white_pegs(peg)
		for guess in @guesses
			if guess == peg and @guesses.index(guess) != @winning_pattern.index(peg)
				whites = whites + 1
			end
		end
	end	

	def play
		puts "Welcome to Mastermind!"
		puts "Enter difficulty level (Enter 'easy', 'medium', or 'hard'):"
		difficulty = gets.chomp
		while @guesses != @winning_pattern
			print_row
			@counter = @counter + 1
			puts "Enter 1st Guess:"
			guess_1 = gets.chomp
			@guesses << guess_1
			puts "Enter 2nd Guess:"
			guess_2 = gets.chomp
			@guesses << guess_2
			puts "Enter 3rd Guess:"
			guess_3 = gets.chomp
			@guesses << guess_3
			puts "Enter 4th Guess:"
			guess_4 = gets.chomp
			@guesses << guess_4

			for guess in @guesses
				colorize_guess(guess)
				for peg in @winning_pattern
					red_pegs(peg)
					white_pegs(peg)
				end
				
			end
			@rows[row_number - 1 - counter] = @guesses.join(" ") + "  #{@reds.to_s}  #{}"
			@guesses = 0
			@reds = 0
			@whites = 0

		end
	end
end




