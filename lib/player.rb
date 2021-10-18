class Player
  
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damages)
    @life_points -= damages
    if @life_points <= 0 then puts "Le joueur #{@name} a été tué !" end
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque le joueur #{player.name} ... !"
    damages = compute_damage
    puts "... et lui inflige #{damages} de dégâts !!"
    puts
    player.gets_damage(damages)
    sleep 0.5
  end

  def compute_damage
    return rand(1..6)
  end

end