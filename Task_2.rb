class Player

  $name = [ ]
  $manna = Array.new(name.length,40)
  $blood = Array.new(name.length,100)
  $x = 0
  
  def initialize
    puts "================================"
    puts "Welcome to the Battle Arena"
    puts "--------------------------------"
    puts 'Description :'
    puts '1. type "new" to create a character'
    puts '2. type "start" to begin the fight'
    puts '--------------------------------'
  end

  def setPlay(getPlay)
    if getPlay == "new"
      print "Put Player Name : "
      get_name = gets.chomp.to_s
      $name.push get_name
      char($name)
    else
      start
    end
  end

  def char(name)
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

  def status
    puts "Description :"
    d = 0
    while d < $name.length do
      d += 1
    end
    $x = d

    $name.each do |i|
      puts "<Player Name '#{i}'>"
      puts "<Manna Status : '#{$manna[$x]}'>"
      puts "<Blood Status : '#{$blood[$x]}'>"
      puts "--------------------------------"
    end
  end

  def start
    puts "================================"
    puts "Ready for the Battle Arena ?"
    puts "--------------------------------"

    status
    v = 100
    while v > 0 do
      print "Who attack : "
      @attacked = gets.chomp.to_str

      if @attacked != '' 
        $manna[$x] -=20
      end

      if $manna[$x] < 0
        puts "\tnot enough manna,if you continue it will be -manna"
      end

      for h in 2..$name.length
          print "Who will attacked : "
          @attack = gets.chomp.to_str
          $blood[$x] -=20
      end

      status
      if $blood[$x] == 0
        puts "Game Over !"
        playAgain 4
      end
      v -=20
    end
  end

  def playAgain(i)
    print "play again (y/n) ? "
    ask = gets.chomp.to_s

    if ask == "y" || ask == "Y"
      $manna[$x] = 40
      $blood[$x] = 100
      $name.clear
      i = 0
      initialize
      while i < 4 do
        print "input : "
        setPlay(gets.chomp.to_str)
        i += 1
      end

    else
      exit
    end

  end

end

i = 0
Pl = Player.new()

while i < 4 do
  print "input : "
  Pl.setPlay(gets.chomp.to_str)
  i += 1
end