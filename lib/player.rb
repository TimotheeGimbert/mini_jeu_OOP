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

  
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    level = rand(1..6)
    puts "Tu as trouvé une nouvelle arme de niveau #{level} !!!"
    if level > @weapon_level
      @weapon_level = level
      puts "Excellent elle est meilleure que la tienne, tu peux la garder !"
    else 
      puts "Arf elle est bidon cette arme ... dommage ..."
    end
  end

  def search_health_pack
    h = rand(1..6)
    if h == 1
      puts "Tu n'as rien trouvé"
    elsif h <= 5
      @life_points > 50 ? @life_points = 100 : @life_points += 50
      puts "Bien ouaij' tu as trouvé un pack de vie +50 dude !"
    elsif h == 6
      @life_points > 20 ? @life_points = 100 : @life_points += 80
      puts "Bien ouaij' tu as trouvé un pack de vie +80 mec !"
    end
  end

end