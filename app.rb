require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

system('clear') # Vide le terminal avant de lancer le jeu

player1 = Player.new('Josiane') # Création des joueurs
player2 = Player.new('José')

# Boucle du jeu
while player1.life_points > 0 && player2.life_points > 0 do
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts puts 
  puts ">>>>>>> PHASE D'ATTAQUE <<<<<<< "
  puts puts "---------------------------"
  player1.attacks(player2) # Attaque du joueur 1
  if player2.life_points <= 0 then break end # Mort du joueur 2
  player2.attacks(player1) # Riposte du joueur 2
end

# binding.pry
