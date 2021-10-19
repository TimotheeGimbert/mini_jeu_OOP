class Game

  attr_accessor :human_player, :players_left, :enemies_in_sight

  def initialize(hero_name)
    @human_player = HumanPlayer.new(hero_name)
    @players_left = 10 # numbers of zombies to kill
    @enemies_in_sight = Array.new
    for n in 1..4 do
      player = Player.new('Zombie_' + n.to_s) # 4 zombies can be in sight
      @enemies_in_sight << player
    end
  end

  def kill_player(player_name)
  # Deletes a dead zombie from the game
    @enemies_in_sight.delete(player_name)
    @players_left -= 1
  end

  def is_ongoing?
  # Cehcks if there are zombies left and if player is still alive
    @human_player.life_points > 0 && @players_left > 0 ? true : false
  end

  def show_gamers
  # Show Player's stats and zombies left in game
    @human_player.show_state
    puts
    puts ">>> Il rEsTe #{@players_left} eNnemiEs sUr lE tErrAin !".red
  end

  def menu
  # Display the menu of actions
    puts puts
    puts ">>> QuElLe aCtiOn déSireS-tU eFfEctUer #{@human_player.name} ?".green
    puts
    puts '-------------------------------------------------------------'.blue.blink
    puts "                | RENFORCER TES CAPACITES |".blue
    puts '-------------------------------------------------------------'.blue.blink
    puts '       |a| CheRcHer uNe mEilLeUre aRme aUx AlenToURs'
    puts "       |s| PaRtiR eN qUêtE d'UnE trOuSsE De sOiN"
    puts
    puts '-------------------------------------------------------------'.red.blink
    puts "                   | DEBOITER DU ZOMBI |".red
    puts '-------------------------------------------------------------'.red.blink
    for i in 0..@enemies_in_sight.length-1 do
      puts " |#{i+1}| AtTaQueR #{@enemies_in_sight[i].name} qUi eSt eN vuE aVeC #{@enemies_in_sight[i].life_points} pOintS dE viE !"
    end
    puts
  end

  def menu_choice(choice)
  # Runs the sequence of the game based on player's choice
    puts puts
    case choice
      when 'a' then @human_player.search_weapon
      when 's' then  @human_player.search_health_pack
    end
    for i in 1..@enemies_in_sight.length do
      if choice == i.to_s
        e = @enemies_in_sight[i-1]
        @human_player.attacks(e)
        if e.life_points <= 0 then kill_player(e) end
      end
    end
  end

  def enemies_attack
  # Zombies' hord attack the player
    @enemies_in_sight.each do |e| 
      e.attacks(@human_player)
      sleep 0.1
    end
    @human_player.show_state
  end

  def add_players_in_sight
  # Describes the ennemies situation and randomly adds zombies in sight
    if @enemies_in_sight.length == @players_left
      puts "AlL PlaYErS arE iN sIgHt !".green
    else
      randint = rand(1..6)
      if @enemies_in_sight.length <= 1
        case randint
        when 1
          puts
          puts "AuCUn eNneMi à L'hOriZon !".green
        when 2..4
          player = Player.new('Zombie_Résistant_Seul')
          @enemies_in_sight << player
          puts
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".red
          puts "Un enNeMi aRrivE eN vUe !".red
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".red
        when 5..6
          for i in 1..2 do
            player = Player.new('Zombie_Résistant_' + i.to_s)
            @enemies_in_sight << player
          end
          puts
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".red
          puts "DeUx enNeMiS aRrivEnT eN vUe !".red
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!".red
        end
      end
    end
  end

  def end
  # Sadly the end of the game is describe here
    puts puts puts
    puts ">>> eNd oF thE GaMe ! <<< ".green
    puts puts puts
    if @human_player.life_points > 0
      puts ">>>>>>>>>>>>> brAvO Tu aS gAgNé la PArTie #{@human_player.name}!".white.on_green
    else
      puts "Tu As pErdU poIl aU RurU, Tu Es fiNi pOil Au RuBy !".red.on_white
    end
    puts puts puts
  end

end