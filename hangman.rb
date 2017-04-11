class Console
	def initialize(open_guesses, wrong_letters, wrong_guess_counter)
		@open_guesses = open_guesses;
		@wrong_letters = wrong_letters;
		@wrong_guess_counter = wrong_guess_counter;
		self.display();
	end

	def display
		puts @open_guesses.join(' ')
		puts 'Wrong Letters: '+@wrong_letters
		puts 'Wrong Guesses Left: '+@wrong_guess_counter.to_s
	end

end

class Game
	def initialize()
		@secret_word = "lynx";
	    @open_guesses = ['_', '_', '_', '_'];
		@wrong_letters = '';
		@wrong_guess_counter = 5;
		Console.new(@open_guesses, @wrong_letters, @wrong_guess_counter)
		self.deal_with_input();
	end

	def deal_with_input
		answer = gets.chomp.downcase;
		input_index = @secret_word.downcase.index(answer);
		if input_index != nil
			@open_guesses[input_index] = answer;
		elsif @wrong_letters.index(answer) != nil
			puts "YOU HAVE ALREADY CHOSEN THE LETTER '#{answer}'"
		else
		  	@wrong_letters += answer;
		  	@wrong_guess_counter -= 1;
		end
		Console.new(@open_guesses, @wrong_letters, @wrong_guess_counter);
		end_or_continue();
	end

	def end_or_continue
		if @open_guesses.index('_') == nil
			while true
				puts "YOU WON!!!";
			end
		end
		if @wrong_guess_counter > 0
			self.deal_with_input();
		else
			puts "Sorry, you lost..."
			puts " =( =( =( "
			puts "The answer was LYNX"
		end
	end

end

game = Game.new

