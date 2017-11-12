class String
  def initial
    self[0,1]
  end
end

class Word 
  attr_accessor :wrd
  attr_reader :lngth
  attr_accessor :guess_wrd
  attr_accessor :shots
  
  def initialize()
   
    @wrd = gets.chomp
    @lngth = @wrd.length
    @guess_wrd = Array.new(@lngth, "_")
    @shots = $attempts
  end
  
  def get_guess_wrd()
    for i in 0..@lngth
      print @guess_wrd[i]
    end
    print "\n"
  end
  
  def check()
    equal = true
    for i in 0..@lngth
      if @wrd[i] != @guess_wrd[i]
        equal = false 
      end
    end
    if equal == true 
      true
    else 
      false 
    end
  end
end 

def options()
  print "\n"
  puts "Ustawienia:"
  puts "\t1.Ilość niepoprawnych odpowiedzi: #{$attempts}"
  puts "\t2.Powrót."
  tmp = gets.chomp
  if tmp == '1' 
    print "\n"
    puts "Wprowadź wartość: "
    tmp = gets.chomp
    $attempts = tmp.to_i
    options()
  elsif tmp == '2'
    menu()
  else
    puts "ERROR"
  end
end

def menu()
   puts "\nWisielec - wersja obiektowa"
  puts "1. Rozpocznij gre"
  puts "2. Zmień ustawienia"

  choice = gets.chomp
  if choice == '1'
    print "\n"
    puts "Wprowadź słowo klucz: "
    curr_word = Word.new()
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    while(curr_word.shots != 0)
    
      puts "Ilość skuch: #{curr_word.shots}. Wprowadz jedną litere: "
      letter = gets.chomp
      letter = letter.initial
      temp = 0
      
      for i in 0..curr_word.lngth do
        
        if curr_word.wrd[i] == letter
          curr_word.guess_wrd[i] = letter
          temp = 1
        end
        
      end
      
      
      if curr_word.check()
        puts "Brawo! Odgadłeś szukane słowo - #{curr_word.wrd}!"
        exit!
      elsif (curr_word.shots - 1) == 0 && temp == 0
        puts "Niestety przegrałeś, może następnym razem"
        exit!
      elsif temp == 1 
        curr_word.get_guess_wrd()
        puts "Dobry strzał! Próbuj dalej."
      else
        puts "Pudło... Nie poddawaj się!"
         curr_word.shots = curr_word.shots - 1
      end
      
      
      
      temp = 0 
    end
  elsif choice == '2'
    options()
  else
    puts "Error"
  end
end

$attempts = 5;

menu()



