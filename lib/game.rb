class Game

  attr_accessor :human_player, :enemies

  def initialize(hero_name)
    @human_player = HumanPlayer.new(hero_name)
    @enemies = Array.new
    for n in 1..4 do
      player = Player.new('Zombie_' + n.to_s)
      @enemies << player
    end
  end

  def kill_player(player_name)
    @enemies.delete(player_name)
  end

  def is_ongoing?
    @human_player.life_points > 0 && @enemies.length > 0 ? true : false
  end

  def show_gamers
    @human_player.show_state
    puts "Il rEsTe #{@enemies.length} eNnemiEs sUr lE tErrAin !"
  end

  def menu
    puts puts
    puts "QuElLe aCtiOn déSireS-tU eFfEctUer #{@human_player.name} ?"
    puts '------------------------------------'
    puts 'a - CheRcHer uNe mEilLeUre aRme aUx AlenToURs'
    puts "s - PaRtiR eN qUêtE d'UnE trOuSsE De sOiN"
    puts
    for i in 0..@enemies.length-1 do
      if @enemies[i].life_points > 0 then puts "#{i+1} - AtTaQueR #{@enemies[i].name} qUi eSt eN vuE aVeC #{@enemies[i].life_points} pOintS dE viE !" end
    end
    puts
  end

  def menu_choice(choice)
    system('clear')
    case choice
      when 'a' then @human_player.search_weapon
      when 's' then  @human_player.search_health_pack
    end
    for i in 1..@enemies.length do
      if choice == i.to_s
        e = @enemies[i-1]
        @human_player.attacks(e)
        if e.life_points <= 0 then kill_player(e) end
      end
    end
  end

  def enemies_attack
    @enemies.each do |e| 
      e.attacks(@human_player)
      sleep 0.1
    end
    @human_player.show_state
  end

  def end
    system('clear')
    puts puts puts
    puts ">>> eNd oF thE GaMe ! <<< "
    puts puts puts
    if @human_player.life_points > 0
      puts ">>>>>>>>>>>>> brAvO Tu aS gAgNé la PArTie #{@human_player.name}!"
    else
      puts "Tu As pErdU poIl aU RurU, Tu Es fiNi pOil Au RuBy !"
    end
    puts puts puts
  end

end