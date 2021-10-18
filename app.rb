require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

system('clear')

player1 = Player.new('Josiane')
player2 = Player.new('José')

while player1.life_points > 0 && player2.life_points > 0 do
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts puts 
  puts ">>>>>>> PHASE D'ATTAQUE <<<<<<< "
  puts puts "---------------------------"
  player1.attacks(player2)
  if player2.life_points <= 0 then break end
  player2.attacks(player1)
end

binding.pry
