class Player

  $name  = [ ]
  $x = 0
  $manna = Hash.new{40}
  $blood = Hash.new{100}

  def initialize #done
    puts "================================"
    puts "Welcome to the Battle Arena"
    puts "--------------------------------"
    puts 'Description :'
    puts '1. type "new" to create a character'
    puts '2. type "start" to begin the fight'
    puts '--------------------------------'
  end

  def setPlay(getPlay) #done
    if getPlay == "new"
      print "Put Player Name : "
      get_name = gets.chomp.to_s
      $name.push get_name
      char($name)
    else
      start
    end
  end

  def char(name) #done
    initialize
    puts "Current Player :"

    $name = name
    $name.each do |i|
      puts "- #{i}"
    end

    puts '================================'
    puts "Maks Player 2-3"
    puts '--------------------------------'
  end

  def start #finnaly_done
    puts "================================"
    puts "Ready for the Battle Arena ?"
    puts "--------------------------------"

    status
    v = 100
    while v > 0 do
      print "Who attack : "
      @attacked = gets.chomp.to_str
      $manna[@attacked] -= 20
      
      if $manna[@attacked] < 0
        puts "\tnot enough manna,if you continue it will be -manna"
      end

      for h in 2..$name.length
          print "Who will attacked : "
          @attack = gets.chomp.to_str
          $blood[@attack] -= 20
      end

      status

      if $blood[@attack] == 0
        puts "Game Over !"
        playAgain 4
      end
#     v -=20
    end
  end

  def status #done
    puts "Description :"
    return $name.each do |i|
      puts "<Player Name '#{i}'>"
      puts "<Manna Status : '#{$manna[i]}'>"
      puts "<Blood Status : '#{$blood[i]}'>"
      puts "--------------------------------"
    end
  end
  
  def playAgain(i) #done
    print "play again (y/n) ? "
    ask = gets.chomp.to_s

    if ask == "y" || ask == "Y"
      $manna["$name"] = 40
      $blood["$name"] = 100
      $name.clear
      i = 0
      initialize
      while i < 4 do
        print "input : "
        setPlay(gets.chomp.to_str)
        i += 1
      end

    else
      puts "Thank You,Play It Again"
      exit
    end

  end

end

#done
i = 0
Pl = Player.new()

while i < 4 do
  print "input : "
  Pl.setPlay(gets.chomp.to_str)
  i += 1
end