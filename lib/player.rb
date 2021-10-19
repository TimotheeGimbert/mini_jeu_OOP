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
  # Player loses life points
    @life_points -= damages
    if @life_points <= 0 then puts "Le joueur #{@name} a été tué !".red.on_white end
  end

  def attacks(player)
  # Attack of an enemy on the player
    damages = compute_damage
    puts "#{@name} attaque #{player.name} ... et inflige #{damages} de dégâts !".red
    player.gets_damage(damages)
    sleep 0.15
  end

  def compute_damage
  # Defines the random damage coef
    return rand(1..6)
  end

end

# HumanPlayer class herits from Player, as it has special faculties
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name) # get initialize method from Player
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts '____________________________________________________________________________________'.blue
    puts
    puts ">>> ".blue + "#{@name}".white + ", tU aS aCtuElLemEnt ".blue + "#{@life_points} pOiNts dE Vie".white + " eT uNe ".blue + "ArMe dE NiVEau #{@weapon_level} ".white + "<<<".blue
  end

  def compute_damage
  # Random power coef based on weapon_level
    rand(1..6) * @weapon_level
  end

  def search_weapon
  # Looks for weapons around and compare to current player's weapon
    level = rand(1..6)
    if level > @weapon_level
      @weapon_level = level
      puts "--> Excellent tu as trouvé une arme plus puissante de niveau #{level} !".green
    else 
      puts "--> Arf l'arme que tu as trouvé de niveau #{level} est bidon par rapport à la tienne niveau #{@weapon_level} ... too bad !".red
    end
  end

  def search_health_pack
  # Searches for health based on random int
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