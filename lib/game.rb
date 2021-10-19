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

  def kill_player(name)
    @enemies.delete(name)
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

end