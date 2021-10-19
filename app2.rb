require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

system('clear')

puts "---------------------------------"
puts "| WelCoMe tO dA GaMe maMainE !  |"
puts "| i hOpE yOu'Ll sUrVivE iT ...  |"
puts "---------------------------------"
puts puts
sleep 0.5
puts puts

puts "QuEl Est vOtrE nOm ...?"
puts
player_name = gets.chomp
player = HumanPlayer.new(player_name) # Création du joueur humain 

enemies = Array.new # Création de la liste des ennemies
bot1 = Player.new('Josiane')
bot2 = Player.new('José')
enemies << bot1
enemies << bot2

# Boucle du jeu
while player.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
  player.show_state
  puts puts
  puts 'Quelle action désires-tu effectuer ?'
  puts '------------------------------------'
  puts 'a - Chercher une meilleure arme dans les parages'
  puts 's - Chercher une trousse de soin'
  puts
  # On affiche les ennemis encore vivants
  if bot1.life_points > 0 then puts "1 - Attaquer le joueur #{bot1.name} qui a #{bot1.life_points} points de vie !" end
  if bot2.life_points > 0 then puts "2 - Attaquer le joueur #{bot2.name} qui a #{bot2.life_points} points de vie !" end
  puts
  player_action = gets.chomp.to_s # On récupère le choix du joueur
  puts puts
  if player_action == 'a' then player.search_weapon
    elsif player_action == 's' then player.search_health_pack
    elsif player_action == '1' then player.attacks(bot1)
    elsif player_action == '2' then player.attacks(bot2)
    else puts 'Dommage, ton choix était ératique ... tu passes ton tour !' # On saute un tour pour les mauvaises touches
  end
  sleep 0.5
  if bot1.life_points <= 0 then enemies.delete(bot1) end # Removes dead bots from array enemies
  if bot2.life_points <= 0 then enemies.delete(bot2) end
  puts '>>> REVENGE OF THE BOTS'
  enemies.each {|e| 
    e.attacks(player)
    if player.life_points <= 0 then puts "Le joueur #{player.name} a été tué !" end # La triste éventuelle mort du joueur
  }
  sleep 0.5
end

sleep 1
puts ">>> eNd oF thE GaMe ! <<< "
puts player.life_points > 0 ? ">>>>>>>>>>>>> Tu aS gAgNé la PArTie maMaIne!".green : "Tu as perdu poil au Ruru, tu es fini poil au Ruby !".red
puts
# binding.pry