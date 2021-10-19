require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


system('clear')
puts "---------------------------------"
puts "| WelCoMe tO dA zOmBiEs GaMe !  |"
puts "|    we hOpE yOu'Ll sUrVivE     |"
puts "---------------------------------"
puts puts
sleep 0.5

puts "QuEl Est toN nOm de HerO ... ?"
puts
hero_name = gets.chomp

game = Game.new(hero_name)

while game.is_ongoing? do
  game.menu
  choice = gets.chomp.to_s
  game.menu_choice(choice)
  puts
  if game.enemies.length == 0 then break end
  game.human_player.show_state
  puts puts
  puts '-------> PRèS pOuR lA RipOStE zOmBiE ?? <-------'
  puts puts 
  gets.chomp
  game.enemies_attack
end

game.end
